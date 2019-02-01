use Mix.Config

config :twitch_api, :keys,
  client_id: "client_id key",
  client_secret: "client_secret key"

config :twitch_api, :http,
  pool: :twitch_api_pool,
  timeout: 10_000
