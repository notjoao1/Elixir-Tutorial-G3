# Comprehensions can often be used to produce more concise statements

list = [1, 2, 3, 4, 5]
for x <- list, do: x*x
# >> [1, 4, 9, 16, 25]

# Generators are the x <- list expressions found in list comprehensions.
# They’re responsible for generating the next value (lazily).

# comprehensions aren’t limited to lists; in fact they’ll work with any enumerable
# Keyword Lists
for {_key, val} <- [one: 1, two: 2, three: 3], do: val
# >> [1, 2, 3]

# Maps
for {k, v} <- %{"a" => "A", "b" => "B"}, do: {k, v}
# >> [{"a", "A"}, {"b", "B"}]

# Binaries
for <<c <- "hello">>, do: <<c>>
# >> ["h", "e", "l", "l", "o"]

# Like many other things in Elixir, generators rely on pattern matching to compare their input set to the left side variable.
# In the event a match is not found, the value is ignored:
for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: val
# >> ["Hello", "World"]

# It’s possible to use multiple generators, much like nested loops:
for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
# >> [a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]

# When a filtered value returns false or nil it is excluded from the final list.
for x <- 1..10, rem(x,2)==0, do: x
# >> [2, 4, 6, 8, 10]

# What if we want to produce something other than a list?
# Given the :into option we can do just that.
for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: {k, v}
# >> %{one: 1, three: 3, two: 2}
