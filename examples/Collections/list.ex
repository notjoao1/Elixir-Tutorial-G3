# Lists are simple collections of values which may include multiple types;
# lists may also include non-unique values:

list = [3.14, :pie, "Apple"]

# Elixir implements list collections as linked lists.
# This means that accessing the list length is an operation that will run in linear time (O(n)).
# For this reason, it is typically faster to prepend than to append:

# Prepending (fast)
["π" | list]
# >> ["π", 3.14, :pie, "Apple"]
# Appending (slow)
list ++ ["Cherry"]
# >> [3.14, :pie, "Apple", "Cherry"]

# List concatenation uses the `++/2` operator:
[1, 2] ++ [3, 4, 1]
# >> [1, 2, 3, 4, 1]

# Support for subtraction is provided via the `--/2` operator;
# it’s safe to subtract a missing value:

["foo", :bar, 42] -- [42, "bar"]
# >> ["foo", :bar]

# Be mindful of duplicate values.
# For every element on the right, the first occurrence of it gets removed from the left:

[1,2,2,3,2,3] -- [1,2,3,2]
# >> [2, 3]

# Note: List subtraction uses strict comparison to match the values.

# When using lists, it is common to work with a list’s head and tail.
# The head is the list’s first element, while the tail is a list containing the remaining elements.
# Elixir provides two helpful functions, hd and tl, for working with these parts:
hd [3.14, :pie, "Apple"]
# >> 3.14
tl [3.14, :pie, "Apple"]
# >> [:pie, "Apple"]

# In addition to the aforementioned functions, you can use pattern matching and the cons operator `|` to split a list into head and tail.
[head | tail] = [3.14, :pie, "Apple"]
# >> [3.14, :pie, "Apple"]
head
# >> 3.14
tail
# >> [:pie, "Apple"]
