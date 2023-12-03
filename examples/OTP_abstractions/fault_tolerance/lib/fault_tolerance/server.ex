defmodule Fault_tolerance.Server do
  use GenServer

  # impl true significa que são implementações de callbacks do GenServer
  @impl true
  def init(_) do
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("----- Starting server... -----")
    Process.sleep(1000) # simulate server start up
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def handle_cast({:run, 5}, _) do
    raise "Error"
  end

  @impl true
  def handle_cast({:run, msgNum}, _) do
    IO.puts("Processing message ##{msgNum}")
    IO.puts("----------------------")
    {:noreply, nil}
  end
end
