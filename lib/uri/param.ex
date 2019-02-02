defmodule TwitchApi.Uri.Param do
  defstruct [:key, :value]

  def new(key, value) when is_bitstring(key) and is_bitstring(value) do
    %__MODULE__{
      key: key,
      value: value,
    }
  end

  def new(key, values) when is_bitstring(key) and is_list(values) do
    %__MODULE__{
      key: key,
      value: values_string(values),
    }
  end

  defp values_string(values) do
    Enum.join(values)
  end
end
