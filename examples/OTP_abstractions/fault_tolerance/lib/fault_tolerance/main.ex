defmodule Fault_tolerance.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Cria worker1 desta forma: Fault_tolerance.Worker1.start_link(arg)
      {Fault_tolerance.Server, nil}
   ]

    # :one_for_one - restart no child process na ocorrência de uma falha
    # Ver https://hexdocs.pm/elixir/Supervisor.html
    # para outras estratégias e options
    opts = [strategy: :one_for_one, name: Fault_tolerance.Supervisor]
    Supervisor.start_link(children, opts)
    # criar cliente
    Fault_tolerance.Client.message_loop()
  end
end
