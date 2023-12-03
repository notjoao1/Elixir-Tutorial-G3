defmodule Worker do
  def perform(:divide, a, b) do
    result =
      case b do
        0 -> {:error, "Division by zero"}
        _ -> {:ok, a / b}
      end

    IO.puts("Result: #{result}")
    result
  end
end

defmodule SupervisorExample do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Worker, [:divide, 10, 2]),
      worker(Worker, [:divide, 20, 0]),  # Simulate a worker failure
      worker(Worker, [:divide, 30, 3])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

SupervisorExample.start_link()
