#   READ AND WRITE FILES
#
#   Aaron Rosas
#   2021-10-05
#
#   UNICAMENTE SE LEE
#       File.read("ALADDIN.txt")
#   SE GUARDA EN LA VARIABLE CONTENTS
#       {:ok, contents} = File.read("ALADDIN.txt")
#   SE HACE UN SPLIT EN \n
#       contents |> String.split("\n", trim: true)
#   LEER CON STREAM
#       data_list

defmodule Rfile do

    def open_file(path) do
        stream = File.stream!(path)
        fixed_contents = stream \
        |> Enum.map(&String.trim/1)
    end
        #{:ok, file} = File.open(path, [:read, :write], fn file -> IO.read(file, :line) end)
end