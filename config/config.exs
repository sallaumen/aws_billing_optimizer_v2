# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :abo,
  ecto_repos: [Abo.Repo]

# Configures the endpoint
config :abo, AboWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bwJycE2O3icW8mKJAfL5kADNOTXrbOzQk9mYAGhppNxWscvs5EH2TpeOD0Dm+sFn",
  render_errors: [view: AboWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Abo.PubSub,
  live_view: [signing_salt: "PorglarM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
