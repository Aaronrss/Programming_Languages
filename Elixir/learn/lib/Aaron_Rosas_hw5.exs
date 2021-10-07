#   HW5
#
#   Aaron Rosas
#   2021-10-06
#
# Write an Elixir script that contains a module called Lists,
# with the following functions:

# Learn to test with Learn.ListsTest defmodule in the lists_test.exs file
defmodule Learn.Lists do

# 1.-
# swapper: Takes a list, and two elements A and B as arguments.
# It will return a new list with any appearance of A substituted for B,
# and vice versa. Any other elements are kept in the same place
    
    # Tail recursion
    def swapper(list, a, b), do: do_swapper(list, a, b, [])
    # Private funcitons that take 4 arguments
        # _ Used to ignore an argument or part of a pattern match expression
    defp do_swapper([], _a, _b, result),
        do: result
    # Use a GUARD to detect if the head is equal to a, before entering the function
    defp do_swapper([head | tail], a, b, result) when head == a,
        do: do_swapper(tail, a, b, result ++ [b])
    # Use a GUARD to detect if the head is equal to b, before entering the function
    defp do_swapper([head | tail], a, b, result) when head == b,
        do: do_swapper(tail, a, b, result ++ [a])
    defp do_swapper([head | tail], a, b, result),
        do: do_swapper(tail, a, b, result ++ [head])

    # First attempt to solve do: (no result)         
        #do: case head do
            #^a -> do_swapper(tail, a, b, result ++ b)
            #^b -> do_swapper(tail, a, b, result ++ a)
            #_ -> do_swapper(tail, a, b, result ++ head)
            #end

# 2.-
# invert_pairs: Takes a list of tuples as argument.
# All tuples must have only two elements. Returns a new list of tuples,
# where each tuple has the elements in inverse order:

    # Tail recursion
    def invert_pairs(list), do: do_invert_pairs(list, [])
    # Private functions that take 2 arguments
    defp do_invert_pairs([], result),
        do: result
    defp do_invert_pairs([head | tail], result),
        # Enum, Provides a set of algorithms to work with enumerables.
        # reverse only works with lists
        do: do_invert_pairs(tail, result ++
            [List.to_tuple(Enum.reverse(Tuple.to_list(head)))])

# 3.-
# deep_reverse: Takes a list as arguments. The list may contain nested lists.
# It will return another list, where the elements are in reverse order.
# The elements in any nested list must also reverse their order.
# You can NOT use the built in function for reverse:

    # Tail recursion
    def deep_reverse(list), do: do_deep_reverse(list, [])
    # Private functions that take 2 arguments
    defp do_deep_reverse([], result),
        do: result
    # Use a GUARD to detect if the head is a list, before entering the function
    defp do_deep_reverse([head | tail], result) when is_list(head),
        # Here happens the deep reverse
        do: do_deep_reverse(tail, [deep_reverse(head) | result])
    defp do_deep_reverse([head | tail], result),
        do: do_deep_reverse(tail, [head | result])

#   First attempt solution (error)
#    def reverse(list), do: do_reverse(list, [])
#    defp do_reverse([], result),
#        do: result
#    defp do_reverse([head | tail], result),
#        do: do_reverse(tail, [head | result])

# 4.-
# mean: Takes a list of numbers as argument. Computes the average of its values,
# as the sum of all of them divided by the number of elements in the list

    # Pattern matching with private functions
    def mean(list), do: do_mean(list)
    # Private fucntions that take 1 argument
    defp do_mean([]),
        do: 0
    defp do_mean(list),
        # Enum, Provides a set of algorithms to work with enumerables.
        do: Enum.sum(list) / Enum.count(list)

# 5.-
# std_dev: Takes a list of numbers as argument.
# Computes the standard deviation, using the following formula:

    # Pattern matching with private functions
    def std_dev(list), do: do_std_dev(list)
    # Private functions that take 1 argument
    defp do_std_dev([]),
        do: 0
    defp do_std_dev(list),
        do: :math.sqrt(do_numerator(list) / Enum.count(list))
    # Private funtion that solve the numerator part of standard deviation
    defp do_numerator(list),
        # Enum, Provides a set of algorithms to work with enumerables.
        # :math, This module contains common mathematical operations covering
        #   trigonometry, exponential, and logarithmic functions.
        do: Enum.sum(Enum.map(list, fn x -> :math.pow(x - mean(list), 2)end))

end