# Using task to launch independent processes
#   The processes
# Aaron Rosas
# 2021-10-15

defmodule Concur do
  @moduledoc """
  Functions to work with concurrent tasks
  """

  @doc """
  Count down from the argument number to 1
  """
  def count(name, 0), do: IO.puts "#{name} finished"
  def count(name, limit) do
    IO.puts "#{name}: #{limit}"
    # Wait a random time from 0 to 1 second
    Process.sleep(:rand.uniform(1000))
    count(name, limit - 1)
  end

  @doc """
  Invoke multiple tasks to do the countdonw simultaneously
  """
  def test_multi(limit) do
    IO.puts "MAIN starting"
    tasks = for n <- 1..limit, do:
              Task.async(fn -> count("thread #{n}", 10) end)
    #IO.inspect(tasks)
    count("MAIN", 10)
    for task <- tasks, do: Task.await(task, 20000)
    IO.puts "MAIN finishing"
  end

  @doc """
  Function to compute the value of PI iteratively
  """
  def get_pi(iterations), do: do_get_pi(iterations, 0)
  defp do_get_pi(0, result), do: result
  defp do_get_pi(n, result),
    do: do_get_pi(n - 1, result + :math.pow(-1, n + 1) * 4 / (2 * n - 1))

  @doc """
  Compute one of the fractions required to get PI
  """
  def get_term(n),
    do: :math.pow(-1, n + 1) * 4 / (2 * n - 1)

  @doc """
  Attempt to compute PI in parallel,
  using as many threads as terms in the calculation
  """
  def slow_pi(limit) do
    result = 1..limit
             |> Enum.map(&Task.async(fn -> get_term(&1) end))
             |> Enum.map(&Task.await(&1))
             |> Enum.sum()
  end

  @doc """
  First attempt at speeding up the calculation
  """
  def test_pi(limit) do
    cores = 8
    block = div(limit, cores)
    result = 1..cores
             |> Enum.map(&Task.async(fn -> get_term(&1 * block) end))
             |> Enum.map(&Task.await(&1))
             |> Enum.sum()
  end

end
