# Module attributes are most commonly used as constants in Elixir.

defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end

# It is important to note there are reserved attributes in Elixir. The three most common are:
# moduledoc — Documents the current module.
# doc — Documentation for functions and macros.
# behaviour — Use an OTP or user-defined behaviour.
