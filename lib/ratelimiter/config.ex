defmodule TwitchApi.Ratelimiter.Config do
  defstruct [:interval, :count]

  @doc """
  * Interval: ratelimiter interval in seconds
  * Limit: amount of requests to allow for specified interval
  """
  def new(interval, count) when is_integer(count) and is_integer(interval) do
    %__MODULE__{
      interval: interval,
      count: count
    }
  end
end
