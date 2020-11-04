defmodule Athena.Debugger do

  def execute_query_and_get_response do
    get_test_query()
    |> Athena.Query.StartExecution.start_and_sleep(2000)
    |> Athena.Query.GetExecutionResponse.fetch
  end

  def execute_query_get_response_as_list do
    execute_query_and_get_response()
    |> Enum.map(&(&1["Data"]))
  end

  def execute_query() do
    query_pid = get_test_query()
    |> Athena.Query.StartExecution.start
    query_pid
  end

  def get_query_response_by_uid(uid) do
    Athena.Query.GetExecutionResponse.fetch(uid)
    |> Enum.map(&(&1["Data"]))
  end

  defp get_test_query() do
    ~s"""
    SELECT "lineItem/productcode",
             SUM("lineItem/UnblendedCost") AS cost_amount,
             "lineItem/UsageStartDate"
    FROM "aws-billing"."processing_files"
    GROUP BY  ("lineItem/UsageStartDate", "lineItem/productcode")
    ORDER BY  cost_amount;
    """
  end

end
