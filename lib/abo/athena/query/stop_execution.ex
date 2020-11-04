defmodule Athena.Query.StopExecution do

  def stop(uuid) do
    %{ClientRequestToken: uuid, }
    |> Jason.encode!()
    |> Athena.RequestInterface.request("AmazonAthena.StopQueryExecution")
  end

end
