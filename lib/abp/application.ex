defmodule Abp.Application do

  def basic_app_query_test do
    ~s"""
    SELECT "lineItem/productcode",
             SUM("lineItem/UnblendedCost") AS cost_amount,
             "lineItem/UsageStartDate"
    FROM "aws-billing"."processing_files"
    GROUP BY  ("lineItem/UsageStartDate", "lineItem/productcode")
    ORDER BY  cost_amount;
    """
    |> Athena.Query.StartExecution.start
    |> Athena.Query.GetExecutionResponse.fetch
  end

end
