# basic function: waits 1 second and prints value
sync_fn = fn x ->
  Process.sleep(1000)
  "#{x} return"
end

sync_fn.("olá") # blocks while waiting for function to run

owner_pid = self()

# spawn process to run function again, but without blocking
spawn(fn ->
  result = sync_fn.("Olá")
  send(owner_pid, {:result, result})
end)

IO.puts("i'm not blocked, my worker is working")

# Wait for the spawned process to send a message
receive do
  {:result, result} ->
    IO.puts("Received result from worker #{result}")
after
  2000 -> # if no answer in 2000 ms
    IO.puts("timeout")
end


#   OUTPUT:
# i'm not blocked
# Olá return
