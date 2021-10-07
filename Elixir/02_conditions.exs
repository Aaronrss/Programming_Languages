# First fuctions in Elixir
#
# Aaron Rosas
#2021-09-14

#

sign = fn (number) ->
    if number < 0 do
        :negative
    else
        if number > 0 do
        :positive
        else
            :zero
        end # End of inner if
    end # End of outer if
end # End of function

# Test funcion
IO.puts "Sign of 8 is #{sign.(8)}"
IO.puts "Sign of 8 is #{sign.(-8)}"
IO.puts "Sign of 0 is #{sign.(0)}"

# Version with cond

sign2 = fn (number) ->
    cond do
        number < 0 -> :negative
        number > 0 -> :positive
        true -> :zero
    end # En of outer cond
end # End of function

# Test funcion
IO.puts "Sign of 8 is #{sign2.(8)}"
IO.puts "Sign of 8 is #{sign2.(-8)}"
IO.puts "Sign of 0 is #{sign2.(0)}"


letter_to_grade = fn (letter) ->
    case letter do
        :A -> 100
        :B -> 80
        :C -> 60
    end
end

IO.puts "Grade for A is #{letter_to_grade.(:A)}"
