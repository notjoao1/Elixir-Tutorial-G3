# The first step to metaprogramming is understanding how expressions are represented.
# In Elixir the abstract syntax tree (AST), the internal representation of our code, is composed of tuples.
# These tuples contain three parts: function name, metadata, and function arguments.
# In order to see these internal structures, Elixir supplies us with the `quote/2` function.
# Using `quote/2` we can convert Elixir code into its underlying representation:

quote do: 42
# >> 42

quote do: "Hello"
# >> "Hello"

quote do: :world
# >> :world

quote do: 1 + 2
# >> {:+, [context: Elixir, import: Kernel], [1, 2]}

quote do: if value, do: "True", else: "False"
# >> {:if, [context: Elixir, import: Kernel],[{:value, [], Elixir}, [do: "True", else: "False"]]}

# Notice the first three don’t return tuples? There are five literals that return themselves when quoted:
# :atom
# "string"
# 1 (All numbers)
# [1, 2] (Lists)
# {"hello", :world} (2 element tuples)

# Now that we can retrieve the internal structure of our code, how do we modify it?
# To inject new code or values we use `unquote/1`.
# When we unquote an expression it will be evaluated and injected into the AST.
# To demonstrate `unquote/1` let’s look at some examples:

denominator = 2
quote do: divide(42, denominator)
# >> {:divide, [], [42, {:denominator, [], Elixir}]}
quote do: divide(42, unquote(denominator))
# >> {:divide, [], [42, 2]}

# In the first example our variable denominator is quoted so the resulting AST includes a tuple for accessing the variable.
# In the `unquote/1` example the resulting code includes the value of denominator instead.
