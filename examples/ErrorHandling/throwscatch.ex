# Another mechanism for working with errors in Elixir is throw and catch.
# In practice these occur very infrequently in newer Elixir code but it’s important to know and understand them nonetheless.

# The `throw/1` function gives us the ability to exit execution with a specific value we can catch and use:
try do
  for x <- 0..10 do
    if x == 5, do: throw(x)
    IO.puts(x)
  end
catch
  x -> "Caught: #{x}"
end
# >> 0
# >> 1
# >> 2
# >> 3
# >> 4
# >> "Caught: 5"


