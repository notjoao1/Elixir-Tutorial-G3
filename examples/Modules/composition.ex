# We can add exisiting funcionalities to modules using different ways.

# Alias
# Allows us to alias module names; used quite frequently in Elixir code:

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example1 do
  alias Sayings.Greetings

  def greeting(name), do: Greetings.basic(name)
end

# Without alias

defmodule Example2 do
  def greeting(name), do: Sayings.Greetings.basic(name)
end

# If there’s a conflict between two aliases or we just wish to alias to a different name entirely,
# we can use the :as option:

defmodule Example3 do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end

# It’s even possible to alias multiple modules at once:
defmodule Example4 do
  alias Sayings.{Greetings, Farewells}
end

# Import
# If we want to import functions rather than aliasing the module we can use import

last([1, 2, 3])
# >> ** (CompileError) iex:9: undefined function `last/1`
import List
last([1, 2, 3])
# >> 3

# By default all functions and macros are imported but we can filter them using the :only and :except options.
# we must provide the name/arity(number of arguments) pairs to :only and :except

# Only imports last function from List
import List, only: [last: 1]
# Imports everything but last from List
import List, except: [last: 1]

# In addition to the name/arity pairs there are two special atoms, :functions and :macros, which import only functions and macros respectively:

# Only imports functions from List
import List, only: :functions
# Only imports macros from List
import List, only: :macros

# Require
# We could use require to tell Elixir you’re going to use macros from another module.
# The slight difference with import is that it allows using macros, but not functions from the specified module:

defmodule Example5 do
  require SuperMacros

  SuperMacros.do_stuff
end
# Note: If we attempt to call a macro that is not yet loaded Elixir will raise an error.

# Use
# With the use macro we can enable another module to modify our current module’s definition.
# When we call use in our code we’re actually invoking the `__using__/1` callback defined by the provided module.
# The result of the `__using__/1` macro becomes part of our module’s definition.

defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

# Here we’ve created a Hello module that defines the `__using__/1` callback inside of which we define a `hello/1` function.
# Let’s create a new module so we can try out our new code:

defmodule Example6 do
  use Hello
end

Example6.hello("Sean")
# >> "Hi, Sean"
# Here we can see that use invoked the `__using__/1` callback on Hello which in turn added the resulting code to our module.

# Now that we’ve demonstrated a basic example let’s update our code to look at how `__using__/1` supports options.
defmodule Hello do
  defmacro __using__(opts) do
    greeting = Keyword.get(opts, :greeting, "Hi") # opts[:greeting] and if null = "Hi"

    quote do
      def hello(name), do: unquote(greeting) <> ", " <> name
    end
  end
end

defmodule Example do
  use Hello, greeting: "Hola"
end

Example.hello("Sean")
# >> "Hola, Sean"
