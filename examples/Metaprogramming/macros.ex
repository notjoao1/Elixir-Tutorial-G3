# In the simplest of terms macros are special functions designed to return a quoted expression that will be inserted into our application code.
# Imagine the macro being replaced with the quoted expression rather than called like a function.
# With macros we have everything necessary to extend Elixir and dynamically add code to our applications.
# We begin by defining a macro using `defmacro/2` which, like much of Elixir, is itself a macro (let that sink in).
# As an example we’ll implement `unless` as a macro. Remember that our macro needs to return a quoted expression:

defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

require OurMacro
OurMacro.unless true, do: "Hi"
# >> nil
OurMacro.unless false, do: "Hi"
# >> "Hi"

# Because macros replace code in our application, we can control when and what is compiled.
# An example of this can be found in the Logger module.
# When logging is disabled no code is injected and the resulting application contains no references or function calls to logging.
# This is different from other languages where there is still the overhead of a function call even when the implementation is NOP.
# To demonstrate this we’ll make a simple logger that can either be enabled or disabled:

defmodule Logger do
  defmacro log(msg) do
    if Application.get_env(:logger, :enabled) do
      quote do
        IO.puts("Logged message: #{unquote(msg)}")
      end
    end
  end
end

defmodule Example do
  require Logger

  def test do
    Logger.log("This is a log message")
  end
end

# With logging enabled our test function would result in code looking something like this:
def test do
  IO.puts("Logged message: #{"This is a log message"}")
end
# If we disable logging the resulting code would be:
def test do
end


