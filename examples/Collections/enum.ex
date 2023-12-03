# The Enum module includes over 70 functions for working with enumerables.
# Note: Tuples arent considered enumerables.

# Common functions

# `all?\2` the entire collection must evaluate to true otherwise false will be returned:
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
# >> false

# `any?/2` will return true if at least one item evaluates to true
Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)
# >> true

# If you need to break your collection up into smaller groups, `chunk_every/2` is the function you’re probably looking for:
Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)
[[1, 2], [3, 4], [5, 6]]

# If we need to group our collection based on something other than size, we can use the `chunk_by/2` function.
# It takes a given enumerable and a function, and when the return on that function changes a new group is started and begins the creation of the next.
Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end)
# >> [["one", "two"], ["three"], ["four", "five"], ["six"]]

# `map_every/3` can be very useful to map every nth items, always hitting the first one
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
[1001, 2, 3, 1004, 5, 6, 1007, 8]

# It may be necessary to iterate over a collection without producing a new value, for this case we use `each/2`:
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
# >> one
# >> two
# >> three

# To apply our function to each item and produce a new collection look to the `map/2` function:
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
# >> [-1, 0, 1, 2]

# `min/1` finds the minimal value in the collection:
Enum.min([5, 3, 0, -1])
# >> -1

# `min/2` does the same, but in case the enumerable is empty, it allows us to specify a function to produce the minimum value.
Enum.min([], fn -> :foo end)
# >> :foo

# `max/1` returns the maximal value in the collection:
Enum.max([5, 3, 0, -1])
# >> 5

# Note: `max/2` is to `max/1` what `min/2` is to `min/1`:

# The `filter/2` function enables us to filter the collection to include only those elements that evaluate to true using the provided function.
Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
# >> [2, 4]

# With `reduce/3` we can distill our collection down into a single value.
# To do this we supply an optional accumulator to be passed into our function;
# if no accumulator is provided the first element in the enumerable is used:
Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
# >> 16

Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
# >> 6

# `sort/1` uses Erlang’s term ordering to determine the sorted order:
Enum.sort([:foo, "bar", Enum, -1, 4])
# >> [-1, 4, Enum, :foo, "bar"]

# While `sort/2` allows us to provide a sorting function of our own:
Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
# >> [%{val: 4}, %{val: 1}]

# We can use `uniq/1` to remove duplicates from our enumerables:
Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
# >> [1, 2, 3]

# `uniq_by/2` also removes duplicates from enumerables, but it allows us to provide a function to do the uniqueness comparison.
Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end)
# >> [%{x: 1, y: 1}, %{x: 3, y: 3}]
