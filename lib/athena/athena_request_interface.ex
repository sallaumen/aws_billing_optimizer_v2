defmodule Athena.RequestInterface do

  @config %{
    access_key_id: Application.get_env(:ex_aws, :access_key_id),
    secret_access_key: Application.get_env(:ex_aws, :secret_access_key),
    region: Application.get_env(:abp, :athena_region),
    http_client: HTTPoison,
    json_codec: Poison
  }

  def request(body, action) do
    ExAws.Request.request(
      :post,
      "https://#{Application.get_env(:abp, :athena_url)}/",
      body,
      get_header(action),
      @config,
      :athena
    )
  end

  defp get_header(action) do
    [
      {"X-Amz-Target", action},
      {"Content-Type", "application/x-amz-json-1.1"}
    ]
  end

end
