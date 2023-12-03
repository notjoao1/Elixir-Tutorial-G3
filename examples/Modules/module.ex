# Modules allow us to organize functions into a namespace.
# In addition to grouping functions, they allow us to define named and private functions

defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end

Example.greeting "Sean"
# >> "Hello Sean."

# It is possible to nest modules in Elixir, allowing you to further namespace your functionality:

defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}."
  end

  def evening(name) do
    "Good night #{name}."
  end
end

Example.Greetings.morning "Sean"
# >> "Good morning Sean."


