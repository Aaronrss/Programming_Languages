# First fuctions in Elixir
#
# Aaron Rosas
#2021-09-14

#
triangle_area = fn (base, height) -> base * height / 2 end

#Así se testea
IO.puts("Testing #{triangle_area.(4, 3)}")