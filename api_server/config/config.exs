# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_server,
  ecto_repos: [ApiServer.Repo]

# Configures the endpoint
config :api_server, ApiServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fc2phpz548iPVSVawGZJpMuSs/c54Q0MWWzIuXneIeZRXwRgmbVz2iykTQPLSsrp",
  render_errors: [view: ApiServerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiServer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures the CORS
config :cors_plug,
  # origin: ["http://example.com"],
  origin: ["*"],
  headers: ["*"],
  max_age: 86400,
  # methods: ["GET", "POST"]
  methods: ["*"]

# Configures Arc
config :arc,
  storage: Arc.Storage.Local

# Configures Guardian
config :api_server, ApiServerWeb.Guardian,
  issuer: "api_server",
  secret_key: "S/8fJ7UjV8M4Gjpbu1o8valyKNHnAVRQxVa/MyH1oRm2YjQ+e1ntdO1RjwB8xISg",
  ttl: {1, :day}
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
