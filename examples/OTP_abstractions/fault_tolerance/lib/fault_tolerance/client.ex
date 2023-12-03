defmodule Fault_tolerance.Client do
  def message_loop(msgNum \\ 0) do
    IO.puts("Sending message ##{msgNum}")
    GenServer.cast(Fault_tolerance.Server, {:run, msgNum})
    :timer.sleep(1000)
    message_loop(rem(msgNum + 1, 6))
  end

end
