# Tuples are similar to lists, but are stored contiguously in memory.
# This makes accessing their length fast but modification expensive;
# the new tuple must be copied entirely to memory.

tuple = {3.14, :pie, "Apple"}

# It is common for tuples to be used as a mechanism to return additional information from functions.
File.read("path/to/existing/file")
# >> {:ok, "... contents ..."}
File.read("path/to/unknown/file")
# >> {:error, :enoent}


