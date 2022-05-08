#   HW8
#
#   Aaron Rosas
#   2021-11-04
#
# Write an Elixir functions that work with concurrency and threads.
# Both versions of the program should give 838,596,693,108 as a result.

defmodule Parallel do
    @moduledoc """
    Two versions of a program that calculates the sum of all prime numbers
    less than 5,000,000
    """

    @doc """
    The first version conventionally implements computation in a sequential
    manner.
    """
    def sumofprimes do
        
    end

    @doc """
    The second version performs the computation in parallel through the
    mechanisms provided by the language. The code is parallelised by taking
    advantage of all the available kernels in the system.
    """

    def pSumOfPrimes do
        
    end

    def algoisprime(0), do: false
    def algoisprime(1), do: false
    def algoisprime(n),
        do: do_algoisprime(n, 0)
    defp do_algoisprime(n, a) when rem(n, ), 
        do: do_algoisprime(n + 1, a + n) 
    defp

    end 
end