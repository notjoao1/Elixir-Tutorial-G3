# Challenge: change the code so it can run forever with automatic fault recovery
# Hint: https://elixirschool.com/en/lessons/intermediate/concurrency#process-linking-2
# Can also use monitor: https://elixirschool.com/en/lessons/intermediate/concurrency#process-monitoring-3

# Run in iex: iex fault_tolerance.exs

defmodule Example do
  # 50% chance to work, 50% chance to fail
  def work do
    work = :rand.uniform() > 0.5
    case work do
      true ->
        IO.puts("working")
        Process.sleep(1000)
        work()
      false ->
        exit(:cant_work) 
    end
  end

  def run do
    spawn_link(Example, :work, [])
  end
end


Example.run()
