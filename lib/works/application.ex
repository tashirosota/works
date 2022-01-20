defmodule Works.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    unless Mix.env() == :prod do
      Dotenv.load()
      Mix.Task.run("loadconfig")
    end

    children = [
      # Start the Ecto repository
      Works.Repo,
      # Start the Telemetry supervisor
      WorksWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Works.PubSub},
      # Start the Endpoint (http/https)
      WorksWeb.Endpoint
      # Start a worker by calling: Works.Worker.start_link(arg)
      # {Works.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Works.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WorksWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
