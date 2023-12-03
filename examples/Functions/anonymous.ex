# Just as the name implies, an anonymous function has no name.
# To define an anonymous function in Elixir we need the fn and end keywords.
# Within these we can define any number of parameters and function bodies separated by `->`.

sum = fn (a, b) -> a + b end
sum.(2, 3)
# >> 5

# Using anonymous functions is such a common practice in Elixir there is shorthand for doing so:
sum = &(&1 + &2)
sum.(2, 3)
# >> 5
# Note: we cant make high order( functions that return functions ) functions using two shorthands.

