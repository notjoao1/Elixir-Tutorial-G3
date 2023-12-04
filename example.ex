defmodule Example do
  def add2Integers(int1, int2) do
    int1 + int2
  end

  def templateFunction(fun, args) do
    fun.(hd(args),tl(args) |> hd)
  end
end
