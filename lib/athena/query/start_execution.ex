defmodule Athena.Query.StartExecution do

  def start(query) do
    %{ClientRequestToken: Ecto.UUID.generate,
      QueryString: query,
      WorkGroup: "abp_application"
    }
    |> Poison.encode!()
    |> Athena.RequestInterface.request("AmazonAthena.StartQueryExecution")
    |> sanitize_response
  end

  def start_and_sleep(query, sleep) do
    response = query |> start
    Process.sleep(sleep)
    response
  end

  defp sanitize_response(
         {:ok,
           %HTTPoison.Response{
             body: body, headers: _, request: _, request_url: _, status_code: _
           }
         }
       ) do
    {:ok, %{"QueryExecutionId" => query_execution_id}} = body |> Poison.decode
    query_execution_id
  end
  defp sanitize_response(_) do
    {:error, "Something went wrong :("}
  end

end
