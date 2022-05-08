defmodule CSVdata do
    
    def read do
        File.stream!("t.csv")
        |> Stream.map(&String.trim(&1))
        |> Stream.map(&String.split(&1, ","))
        |> Stream.filter(fn
            ["Hulu"| _] -> false
            [hulu | _] ->
            IO.puts("filter -> #{hulu}")
            true
           # IO.inspect()
        end)
        |> Enum.find(fn
            [hulu | _] ->
                ts = String.to_integer(hulu)
                IO.puts("find -> #{hulu}")
                ts == 1
            end)
    end
end