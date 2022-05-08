#Funcitons to read and write CSV files
#
#
# Aaron Rosas
# 2021-10-08

defmodule CSVdata do
  @moduledoc """
  Functions to open a CSV file, and convert it into a matrix
  """

  @doc """
  Return a matrix with the contents of a CSV file indicated as the argument
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
                      :int -> String.to_integer(value) + 10
                      :float -> String.to_float(value)
                      _ -> value
                    end
                  end
                end
    # Join back the header that was separated when getting the arguments
    [header | new_data]
  end

  @doc """
  Write the contents of a matrix as a csv file
  """
  def write_data(data, filename) do
    {:ok, out_file} = File.open(filename, [:write])
    for row <- data do
      IO.puts(out_file, Enum.join(row, ","))
    end
    File.close(out_file)
  end

  @doc """
  Test function to make everything work
  """
  def main() do
    filename = "market_products.csv"
    # The list of types for each column, in the order they appear in the file
    types = [:str, :int, :float]

    # This is how you could write it in other languages
    #data = write_data(make_numeric(read_data(filename)), "new_" <> filename)

    # Elixir allows using the pipe operator for better readability
    data = filename
           |> read_data()
           |> make_numeric(types)
           |> IO.inspect()
           |> write_data("new_" <> filename)
  end

end