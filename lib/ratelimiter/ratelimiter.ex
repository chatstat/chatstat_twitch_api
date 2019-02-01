defmodule TwitchApi.Ratelimiter do
  use GenServer

  alias TwitchApi.Ratelimiter.Config
  alias TwitchApi.Ratelimiter.State

  def start_link(%Config{} = config) do
    GenServer.start_link(__MODULE__, State.new(config), name: __MODULE__)
  end

  def init(%State{} = state) do
    {:ok, state}
  end

  def inspect() do
    GenServer.call(__MODULE__, :inspect)
  end

  def handle_call(:inspect, _from, %State{} = state) do
    {:reply,{state.config.count, state.count, state.last_update}, state}
  end

  defp update_state(%State{} = state) do

  end
end
