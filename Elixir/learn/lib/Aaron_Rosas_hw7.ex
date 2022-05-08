# HW7
#
# Aaron Rosas
# 2021-10-19
#
# Enum.find_index
# Enum.uniq(resultList)
# Enum.sort
# Enum.frequencies
# Enum.at

defmodule CSVdata do
    @moduledoc """
    Functions to open a CSV file and return a new CSV files.
    
    The result of the program should be a group of new files:
        1.- One file with the totals of the films on each of the services,
        each in a column.
        2.- Four files, each with the number of films per year.
        The years should be sorted in ascending order.
    """

    @doc """
    Recives the matrix and take only the headers in a list.
    """
    def header_list([head | _tail]) do
        _headers = head
    end

    @doc """
    Takes a string with the full path to a CSV file.
    It will open the file and return its contents in a list,
    where each element is a row in the file.
    The rows in turn should also be lists or maps with each element in the row.
    """
    def read_data(filename) do
        filename
        |> File.stream!()
        |> Enum.map(&String.trim/1)
        # Using the 'capture' syntax
        |> Enum.map(&(String.split(&1, ",")))
        # Using a lambda function
        #|> Enum.map(fn row -> String.split(row, ",") end)
        
    end

    @doc """
    Convert into int or float the fields that require it
    Use a second list that indicates the type of each column
    """
    def make_numeric([header | data], types) do
        # The first list comprehension works on each row of the matrix
        new_data = for row <- data do
            # The second comprehension works on each column of the row
            # pairs the columns with the types, using zip
            for {value, type} <- Enum.zip(row, types) do
                # Convert the value in the column depending on the type
                case type do
                # Just to see the changes, add 10 to the stock
                    :int -> String.to_integer(value)
                    _ -> value
                end
            end
        end
        # Join back the header that was separated when getting the arguments
        [header | new_data]
    end

    @doc """
    Takes a matrix (list of lists) with the data,
    and a string with the full path to a file.
    It will write the contents of the matrix into a file, in CSV format.
    """
    def write_data(data, filename) do
        {:ok, out_file} = File.open(filename, [:write])
        for row <- data do
            IO.puts(out_file, Enum.join(row, ","))
        end
        File.close(out_file)
    end

    @doc """
    Takes a matrix (list of lists) with the data from the file,
    and an identifier for the column to use.
    It will return the sum of all the numbers in that column.
    """
    def sum_column([_header | data], columns) do
        new_data = for row <- data do
            Enum.at(row, columns)
        end
        _sum_data = Enum.sum(new_data)
    end

    @doc """
    Takes a matrix (list of lists) with the data, and two column identifiers;
    one for the column to aggregate, and another for the values to add.
    It will return a list of tuples,
    with as many elements as different items in the aggregate column.
    The tuples will contain the id in the aggregated column,
    and the sum of values in the second column that correspond to
    the id in the first.
    """
    def aggregate([header | data], col1, col2) do
        new_data = for row <- data do
            Map.new([Tuple.to_list{Enum.at(row, col1),Enum.at(row,col2)}])
        end
    end

    @doc """
    Takes a string with the full path to a CSV file to use.
    Will call all the other functions, to read the data,
    generate new matrices and write them to files.
    """
    def main() do
        
        filename = IO.gets("Give me the name of the file with the extension: ")
            |> String.replace("\n", "")
        types = [:int, :int, :str, :int, :str, :str, :str, :int, :int, :int, :int]
        
        data = filename
            |> read_data()
            |> make_numeric(types)
            #|> IO.inspect()
            #|> write_data("new_" <> filename)

        headers = header_list(data)
        sum_data = [
            [Enum.at(headers,7), Enum.at(headers,8), Enum.at(headers,9), Enum.at(headers,10)],
            [sum_column(data,7),sum_column(data,8),sum_column(data,9),sum_column(data,10)]
        ]
        write_data(sum_data,"total_movies.csv")
        #write_data(aggregate(data, 3,7),"Netlfix_years.csv")
        #write_data(aggregate(data, 3,8),"Hulu_years.csv")
        #write_data(aggregate(data, 3,9),"Prime_years.csv")
        #write_data(aggregate(data, 3,10),"Disney+_years.csv")
        end
end