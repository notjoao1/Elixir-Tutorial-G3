# If it’s necessary to match against multiple patterns we can use `case/2`

# if ok and something print that something
# else print error
# `_` matches with everything as a way to watch all things
case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error} -> "Uh oh!"
  _ -> "Catch all"
end
# Since passed `{:ok, "Hello World"}` we get
# >> "Hello World"

case :even do
  :odd -> "Odd"
end
# Without `_` we can get errors
# >> ** (CaseClauseError) no case clause matching: :even

# Another neat feature of case/2 is its support for guard clauses
case {1, 2, 3} do
  # x will be assigned 2 then we check if x > 0
  {1, x, 3} when x > 0 ->
    "Will match"
  _ ->
    "Won't match"
end
# >> "Will match"

# The special form `with/1` is useful when you might use a nested `case/2`
# statement or situations that cannot cleanly be piped together.
# The `with/1` expression is composed of the keywords, the generators, and finally an expression.

user = %{first: "Sean", last: "Callan"}

case Map.fetch(user, :first) do
  {:ok, first} ->
    case Map.fetch(user, :last) do
      {:ok, last} ->
        last <> ", " <> first
      error ->
        error
    end
  error ->
    error
end

# The above expression is quite big and maybe hard to understand
# When we introduce `with/1` we end up with:
with {:ok, first} <- Map.fetch(user, :first),
     {:ok, last} <- Map.fetch(user, :last),
     do: last <> ", " <> first
# >> "Callan, Sean"

user = %{first: "doomspork"}
%{first: "doomspork"}
with {:ok, first} <- Map.fetch(user, :first),
     {:ok, last} <- Map.fetch(user, :last),
     do: last <> ", " <> first
# In the event that an expression fails to match, the non-matching value will be returned:
# >> :error
