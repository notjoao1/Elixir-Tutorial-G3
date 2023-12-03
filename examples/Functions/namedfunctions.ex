# We can define functions with names so we can easily refer to them later.
# Named functions are defined within a module using the `def` keyword .
# Functions defined within a module are available to other modules for use.
# This is a particularly useful building block in Elixir:

defmodule Greeter do
  def hello(name) do
    "Hello, " <> name
  end
end

Greeter.hello("Sean")
"Hello, Sean"

# If our function body only spans one line, we can shorten it further with do:

defmodule Greeter do
  def hello(name), do: "Hello, " <> name
end

# functions are named by the combination of given name and arity (number of arguments). This means you can do things like this:

defmodule Greeter do
  def hello(), do: "Hello, anonymous person!"                 # `hello/0`
  def hello(name), do: "Hello, " <> name                      # `hello/1`
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # `hello/2`
end

Greeter.hello()
# >> "Hello, anonymous person!"

Greeter.hello("Fred")
# >> "Hello, Fred"

Greeter.hello("Fred", "Jane")
# >> "Hello, Fred and Jane"

# Unlike function overloads in some other languages, these are thought of as different functions from each other.
# (Pattern matching applies only when multiple definitions are provided for function definitions with the same number of arguments.)

# When we don’t want other modules accessing a specific function we can make the function private.
#  Private functions can only be called from within their own Module. We define them in Elixir with `defp`:

defmodule Greeter do
  def hello(name), do: phrase() <> name
  defp phrase, do: "Hello, "
end

Greeter.hello("Sean")
# >> "Hello, Sean"
Greeter.phrase
# >> ** (UndefinedFunctionError) function `Greeter.phrase/0` is undefined or private Greeter.phrase()

# If we want a default value for an argument we use the `argument \\ value` syntax:
defmodule Greeter do
  def hello(name, language_code \\ "en") do
    phrase(language_code) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

Greeter.hello("Sean", "en")
# >> "Hello, Sean"
Greeter.hello("Sean")
# >> "Hello, Sean"
Greeter.hello("Sean", "es")
# >> "Hola, Sean"
