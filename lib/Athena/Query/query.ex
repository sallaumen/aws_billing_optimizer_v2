defmodule Athena.Query do

    @config %{
      secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
      access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
      region: System.get_env("ATHENA_REGION"),
      http_client: HTTPoison,
      json_codec: Poison
    }

    def execute() do
      body = %{
               NamedQueryIds: ["test"]
             } |> Poison.encode!()

      headers = [
        {"Host", System.get_env("ATHENA_URL")},
        {"X-Amz-Target", "AmazonAthena.BatchGetNamedQuery"},
      ]
      ExAws.Request.request(:post, "https://#{System.get_env("ATHENA_URL")}/", body, headers, @config, :athena)
    end

end
