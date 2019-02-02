defmodule TwitchApi.Uri do

  alias TwitchApi.Uri.Param

  def generate_url(url, params \\ nil) do
    %URI{
      host: url,
      authority: url,
      port: 443,
      scheme: "https",
      path: generate_path(params)
    }
    |> URI.to_string()
  end

  defp generate_path(nil) do
    "/"
  end

  defp generate_path(params) when is_list(params) do
    params = params
    |> Enum.reduce(%{}, fn(%Param{} = param, map) ->
      Map.put(map, param.key, param.value)
    end)
    |> URI.encode_query()

    "/?" <> params
  end
end
