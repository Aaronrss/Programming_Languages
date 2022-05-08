 # Using agents to hold information accessible by name threads
 #
 # Aaron Rosas
 # 2021-11-02

 defmodule Counter do
    use Agent

    def start_link(initial_value) do
        # Uno piece of data
        Agent.start_link(fn -> initial_value end)
    end

    def value(pid) do
        # & anon func and return de first argument
        Agent.get(pid, & &1)
    end

    def increment(pid) do
        Agent.update(pid, &(&1 + 1))
    end

end

defmodule Data do
    use Agent
    def start_link() do
        #Implementing a map for more pieces of data
        Agent.start_link(fn -> %{} end)
    end

    def all(pid) do
        Agent.get(pid, & &1)
    end

    def get(pid, key) do
        Agent.get(pid, &Map.get(&1, key))
    end

    def update(pid, key, value) do
        Agent.update(pid, &Map.put(&1, key, value))
    end
end


defmodule Test do
    def add_day(pid) do
        day = Data.get(pid, :day)
        Data.update(pid, :day, day + 1)
    end

    def print_day(pid, name) do
        day = Data.get(pid, :day)
        IO.puts "Thread #{name} has read day #{day}"
    end

    def repeat(0, name, _func), do: IO.puts "Done #{name}"
    def repeat(times, name, func) do
        func.()
        repeat(times - 1, name, func)
        Process.sleep(1000)
    end

    def main do
        # Create an agent to store the data, keep its process id (PID)
        {:ok, pid} = Data.start_link()
        # Initialize a value in the agent
        Data.update(pid, :day, 4)
        # Launch threas that will repeatedly read the data
        #Threads that call a function
        tasks = 1..3
            |> Enum.map(&Task.async(
                fn -> repeat(5, &1, fn -> print_day(pid, &1) end) end))
        # Add one more thread that will change the data repeatedly 
       _all_tasks = [Task.async(fn -> repeat(5, 0, fn -> add_day(pid) end) end) | tasks]
            # Wait for all threads to finish 
            |> Enum.map(&Task.await(&1, 10000))
    end

end