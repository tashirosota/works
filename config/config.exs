# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :works,
  ecto_repos: [Works.Repo]

# Configures the endpoint
config :works, WorksWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: WorksWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Works.PubSub,
  live_view: [signing_salt: "VKu0FTTw"]

# use DynamoDB
config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: {:system, "AWS_REGION"}

config :ex_aws, :dynamodb,
  scheme: {:system, "DYNAMO_SCHEMA"},
  host: {:system, "DYNAMO_HOST"},
  port: {:system, "DYNAMO_PORT"},
  region: {:system, "AWS_REGION"}

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.13.5",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tailwind,
  version: "3.0.12",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
