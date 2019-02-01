defmodule TwitchApi.Config do
  defstruct [:client_id, :client_secret, :pool, :timeout]

  def new(keys_map, http_map) when is_map(keys_map) and is_map(http_map) do
    map = Map.merge(keys_map, http_map)
    struct(__MODULE__, map)
  end

  @spec read_config() :: %{:__struct__ => atom(), optional(atom()) => any()}
  def read_config() do
    with {:ok, keys_map} <- read_config(:keys),
         {:ok, http_map} <- read_config(:http) do
      new(keys_map, http_map)
    else
      {:error, error} -> {:error, error}
    end
  end

  defp read_config(:keys) do
    case Application.get_env(:twitch_api, :keys) do
      nil -> {:error, :no_twitch_api_keys}
      [client_id: _client_id, client_secret: _client_secret] = data -> {:ok, Enum.into(data, %{})}
      _ -> {:error, :no_twitch_api_keys}
    end
  end

  defp read_config(:http) do
    case Application.get_env(:twitch_api, :http) do
      nil -> {:ok, %{pool: :twitch_api_pool, timeout: 10_000}}
      data -> {:ok, Enum.into(data, %{})}
    end
  end
end
