#Using task to launch independent processes
#
# Aaron Rosas
# 2021-10-15

defmodule Concur do
  @moduledoc """
  Functions to work with concurrent tasks
  """

  @doc """
  Simple test function to be called from the "threads"
  """
  def greet(name), do: IO.puts "Hello from #{name}"

  @doc """
  Simple use of taks functions
  """
  def test_1 do
    IO.puts "MAIN starting"
    # taks will get the PID of the new process
    task = Task.async(fn -> greet("the thread") end)
    # Must always wait for it to finish
    Task.await(task)
    IO.puts "MAIN finishing"
  end

  @doc """
  Creating multiple tasks manually
  """
  def test_2 do
    IO.puts "MAIN starting"
    task1 = Task.async(fn -> greet("the thread 1") end)
    task2 = Task.async(fn -> greet("the thread 2") end)
    task3 = Task.async(fn -> greet("the thread 3") end)
    Task.await(task3)
    Task.await(task2)
    Task.await(task1)
    IO.puts "MAIN finishing"
  end

  @doc """
  Creating multiple tasks using a list comprehension
  """
  def test_3 do
    IO.puts "MAIN starting"
    # The result will be a list of PIDs
    tasks = for n <- 1..4, do:
              Task.async(fn -> greet("the thread #{n}") end)
    IO.inspect(tasks)
    # Wait for all tasks to finiwh
    for task <- tasks, do: Task.await(task)
    IO.puts "MAIN finishing"
  end

end