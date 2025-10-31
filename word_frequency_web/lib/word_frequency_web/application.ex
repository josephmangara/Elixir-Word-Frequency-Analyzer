defmodule WordFrequencyWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WordFrequencyWebWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:word_frequency_web, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WordFrequencyWeb.PubSub},
      # Start a worker by calling: WordFrequencyWeb.Worker.start_link(arg)
      # {WordFrequencyWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      WordFrequencyWebWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WordFrequencyWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WordFrequencyWebWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
