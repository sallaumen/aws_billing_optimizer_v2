defmodule Athena.RequestInterface do

  @config %{
    access_key_id: Application.get_env(:ex_aws, :access_key_id),
    secret_access_key: Application.get_env(:ex_aws, :secret_access_key),
    region: Application.get_env(:abo, :athena_region),
    http_client: HTTPoison,
    json_codec: Jason
  }

  def request(body, action) do
    ExAws.Request.request(
      :post,
      "https://#{Application.get_env(:abo, :athena_url)}/",
      body,
      get_header(action),
      @config,
      :athena
    ) |> sanitize_response
  end

  defp get_header(action) do
    [
      {"X-Amz-Target", action},
      {"Content-Type", "application/x-amz-json-1.1"}
    ]
  end

  defp sanitize_response({:ok, content}) do
    content
  end

  defp sanitize_response({:error, error}) do
    throw error
  end

end
