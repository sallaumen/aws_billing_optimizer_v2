defmodule Abo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
#      Abo.Repo,
      # Start the Telemetry supervisor
      AboWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Abo.PubSub},
      # Start the Endpoint (http/https)
      AboWeb.Endpoint
      # Start a worker by calling: Abo.Worker.start_link(arg)
      # {Abo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Abo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AboWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
