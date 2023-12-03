# While Elixir includes a number of builtin error types like `RuntimeError`, we maintain the ability to create our own if we need something specific.
# Creating a new error is easy with the `defexception/1` macro which conveniently accepts the `:message` option to set a default error message:

defmodule ExampleError do
  defexception message: "an example error has occurred"
end

try do

  raise ExampleError

rescue

  e in ExampleError -> e

end
# >> %ExampleError{message: "an example error has occurred"}
