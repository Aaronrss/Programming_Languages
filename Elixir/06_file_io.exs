# Functions to work with files
#
# Gilberto Echeverria
# 2021-10-05


filename = "test1.txt"
contents = """
This is the text that will go inside the file
Consisting of multiple lines
To test how the different functions work
"""

# Write a file
File.write(filename, contents)

# Read a file, line by line
data_list = File.stream!(filename)

# Display the whole list
for line <- data_list, do: IO.puts line

# Read the whole file as a single string
{:ok, contents} = File.read(filename)

# Display the entire file
IO.puts contents
