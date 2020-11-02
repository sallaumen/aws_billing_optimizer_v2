defmodule Athena.Query.GetExecutionResponse do

  def fetch(uuid) do
    %{QueryExecutionId: uuid} |> Poison.encode!()
    |> Athena.RequestInterface.request("AmazonAthena.GetQueryResults")
    |> sanitize_response
  end

  defp sanitize_response(
         {:ok,
           %HTTPoison.Response{
             body: body, headers: _, request: _, request_url: _, status_code: _
           }
         }
       ) do
    {:ok,
      %{
        "ResultSet" => %{
          "ColumnInfos" => _,
          "ResultRows" => rows,
          "ResultSetMetadata" => _,
          "Rows" => _
        },
        "UpdateCount" => _
      }
    } = body |> Poison.decode
    rows
  end
  defp sanitize_response(_) do
    {:error, "Something went wrong :("}
  end

end
