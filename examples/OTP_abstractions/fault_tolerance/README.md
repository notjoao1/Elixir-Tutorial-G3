# Fault_tolerance

Mock server that receives messages and processes them to demonstrate:
- `GenServer`
- `Supervisor`
  
Uses `Supervisor` to supervise a `GenServer` and always restart it when it fails, for building a fault tolerant system.


## How to run

While in the mix project root, run:

```bash
mix run
```

## Example output

When there's an exception in the `GenServer`, the `Supervisor` will launch a new one because of the `:one_to_one` strategy.

```
----- Starting server... -----
Sending message #0
Processing message #0
----------------------
Sending message #1
Processing message #1
----------------------
Sending message #2
Processing message #2
----------------------
Sending message #3
Processing message #3
----------------------
Sending message #4
Processing message #4
----------------------
Sending message #5

16:45:02.591 [error] GenServer Fault_tolerance.Server terminating
** (RuntimeError) Error
    (Fault_tolerance 0.1.0) lib/fault_tolerance/server.ex:18: Fault_tolerance.Server.handle_cast/2
    (stdlib 3.17) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.17) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.17) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:run, 5}}
State: nil
----- Starting server... -----
Sending message #0
Sending message #1
Processing message #1
----------------------
Sending message #2
Processing message #2
----------------------
Sending message #3
Processing message #3
----------------------
Sending message #4
Processing message #4
----------------------
...
```
