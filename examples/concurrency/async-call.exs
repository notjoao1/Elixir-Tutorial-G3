# Run in iex: iex async-call.exs

# basic function: waits 1 second and prints value
sync_fn = fn x ->
  Process.sleep(1000)
  IO.puts("#{x} return")
end

spawn(fn -> sync_fn.("olá2") end)

IO.puts("i'm not blocked while waiting")
