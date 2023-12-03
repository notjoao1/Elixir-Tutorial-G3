defmodule Looper do
  def loop() do
    receive do
      {:result, result} ->
        IO.puts(result)
    after
      2000 ->
        IO.puts("timeout")
        exit(:over)
    end
    loop()
  end
end

owner_pid = self()

sync_fn = fn x ->
  Process.sleep(1000)
  "#{x} return"
end


Enum.each(1..5, fn x -> spawn(fn ->
    result = sync_fn.(x)
    send(owner_pid, {:result, result})
  end)
end)

IO.puts("do slow stuff here")
# Go receive the results from async calls
Looper.loop()
