# Once Elixir has matched a function any existing guards will be tested.
# In the following example we have two functions with the same signature, we rely on guards to determine which to use based on the argument’s type:

defmodule Greeter do
  def hello(names) when is_list(names) do
    names = Enum.join(names, ", ")

    hello(names)
  end

  def hello(name) when is_binary(name) do
    phrase() <> name
  end

  defp phrase, do: "Hello, "
end

Greeter.hello ["Sean", "Steve"]
# >> "Hello, Sean, Steve"

# In conjuction with deafult arguments
defmodule Greeter do
  def hello(names, language_code \\ "en") when is_list(names) do
    names = Enum.join(names, ", ")

    hello(names, language_code)
  end

  def hello(name, language_code \\ "en") when is_binary(name) do
    phrase(language_code) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end
# >> ** (CompileError) iex:8: def hello/2 defines defaults multiple times. Elixir allows defaults to be declared once per definition.

# Elixir doesn’t like default arguments in multiple matching functions, it can be confusing.
# To handle this we add a function head with our default arguments:

defmodule Greeter do
  def hello(names, language_code \\ "en")

  def hello(names, language_code) when is_list(names) do
    names = Enum.join(names, ", ")

    hello(names, language_code)
  end

  def hello(name, language_code) when is_binary(name) do
    phrase(language_code) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

Greeter.hello ["Sean", "Steve"]
# >> "Hello, Sean, Steve"
Greeter.hello ["Sean", "Steve"], "es"
# >> "Hola, Sean, Steve"
