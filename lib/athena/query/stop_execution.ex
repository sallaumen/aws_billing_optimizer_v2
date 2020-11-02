defmodule Athena.Query.StopExecution do

  def stop(uuid) do
    %{ClientRequestToken: uuid, }
    |> Poison.encode!()
    |> Athena.RequestInterface.request("AmazonAthena.StopQueryExecution")
  end

end
