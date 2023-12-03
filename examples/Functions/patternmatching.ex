# Pattern matching isn’t limited to just variables in Elixir, it can be applied to function signatures.
# Elixir uses pattern matching to check through all possible match options and select the first matching option to run:

handle_result = fn
  {:ok, result} -> IO.puts "Handling result..."
  {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
  {:error} -> IO.puts "An error has occurred!"
end

some_result = 1
# >> 1

handle_result.({:ok, some_result})
# >> Handling result...

handle_result.({:error})
# >> An error has occurred!


# Behind the scenes, functions are pattern-matching the arguments that they’re called with.

defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

Length.of []
# >> 0

Length.of [1, 2, 3]
# >> 3

# More complex example
defmodule Greeter1 do
  def hello(%{name: person_name}) do
    IO.puts "Hello, " <> person_name
  end
end

fred = %{
  name: "Fred",
  age: "95",
  favorite_color: "Taupe"
}

Greeter1.hello(fred)
# >> "Hello, Fred"

# What happens when we call the function with a map that doesn’t contain the :name key?
Greeter1.hello(%{age: "95", favorite_color: "Taupe"})
# >> ** (FunctionClauseError) no function clause matching in `Greeter1.hello/1`

# In `Greeter1.hello/1`, the map we pass (fred) is evaluated against our argument (%{name: person_name}):
%{name: person_name} = %{name: "Fred", age: "95", favorite_color: "Taupe"}
# It finds that there is a key that corresponds to name in the incoming map. We have a match!
# And as a result of this successful match, the value of the :name key in the map on the right (i.e. the fred map)
# is bound to the variable on the left (person_name).
