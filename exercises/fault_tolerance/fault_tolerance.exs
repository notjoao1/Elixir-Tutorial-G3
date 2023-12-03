# Desafio: muda este código para que possa correr para sempre com recuperação automática no caso de falhas
# Dica: https://elixirschool.com/en/lessons/intermediate/concurrency#process-linking-2

defmodule Example do
  # 50% chance to work, 50% chance to fail
  def work do
    work = :rand.uniform() > 0.5
    case work do
      true ->
        IO.puts("working")
        Process.sleep(1000)
        work()
      false ->
        10/0  # arithmetic exception
    end
  end

  def run do
    spawn_link(Example, :work, [])
  end
end

# Para correr (no iex):
#
#   Code.require_file("fault_tolerance.exs")
#   Example.run()
