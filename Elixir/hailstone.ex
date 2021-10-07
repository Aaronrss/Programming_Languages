# Definition of the hailstone functions
#
# Aaron Rosas
# 2021-10-01
#
# COMMAND TO TEST SOMETHING
#   mix test


defmodule Learn.Hailstone do
    @moduledoc """
    Implementation of functions to get the Hailstone sequence
    """

    def hailstone(0), do: []
    def hailstone(n), do: do_hailstone(n, [])

    defp do_hailstone(1, result),
        # reverse the list is much faster
        do: Enum.reverse([1 | result])
        # append something into the beginning
        #do: [ 1 | result ]
    defp do_hailstone(n, result) when rem(n, 2) == 0,
        do: do_hailstone(div(n. 2), result ++ [n])
    defp do_hailstone(n, result),
        do: do_hailstone(n * 3 + 1, result ++ [n])
end