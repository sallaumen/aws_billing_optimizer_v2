defmodule Athena.Query.StartExecution do

  def start(query) do
    %{ClientRequestToken: Ecto.UUID.generate,
      QueryString: query,
      WorkGroup: "abp_application" #TODO Fix to abo
    }
    |> Jason.encode!()
    |> Athena.RequestInterface.request("AmazonAthena.StartQueryExecution")
    |> sanitize_response
  end

  def start_and_sleep(query, sleep) do
    response = query |> start
    Process.sleep(sleep)
    response
  end

  defp sanitize_response(
           %HTTPoison.Response{
             body: body, headers: _, request: _, request_url: _, status_code: _
           }
       ) do
    %{"QueryExecutionId" => query_execution_id} = body |> Jason.decode!
    query_execution_id
  end
  defp sanitize_response(_) do
    {:error, "Something went wrong :("}
  end

end
