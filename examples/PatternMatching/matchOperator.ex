# In Elixir, the = operator is actually a match operator, comparable
# to the equals sign in algebra. Writing it turns the whole expression
# into an equation and makes Elixir match the values on the left hand
# with the values on the right hand. If the match succeeds, it returns
# the value of the equation. Otherwise, it throws an error. Let’s take a look:


# We can assign 1 to x.
x = 1
# >> 1

# Since 1 = 1 , the match succeeds and returns 1
1 = x
# >> 1

# No mactch, so we get an error
2 = x
# >> (MatchError) no match of right hand side value: 2

# The match operator can only assign to variables on the left
1 = unknown
# >> ** (CompileError) iex:1: undefined variable "unknown"

# We can use also use match we collections
list = [1, 2, 3]
[1 | tail] = list
# >>[1, 2, 3]
tail
# >> [2, 3]
[2 | _] = list
# >> ** (MatchError) no match of right hand side value: [1, 2, 3]

# Tuples
{:ok, value} = {:ok, "Successful!"}
# >> {:ok, "Successful!"}
value
# >> "Successful!"
{:ok, value} = {:error}
# >> ** (MatchError) no match of right hand side value: {:error}
