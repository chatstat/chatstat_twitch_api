defmodule TwitchApi.Ratelimiter.State do
  alias TwitchApi.Ratelimiter.Config

  defstruct [:config, :updated_at, :last_update, :count]

  def new(%Config{} = config) do
    %__MODULE__{
      config: config,
      updated_at: :os.system_time(:millisecond),
      last_update: :os.system_time(:millisecond),
      count: config.count
    }
  end
end
