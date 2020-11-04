defmodule AboWeb.TestQueryController do
  use AboWeb, :controller

  # Call example: http://localhost:8000/executeTestQueryAndGetResponse
  def execute_test_query_and_get_response(conn, _params) do
    json conn, Athena.Debugger.execute_query_and_get_response()
  end

  # Call example: http://localhost:8000/executeTestQuery
  def execute_test_query(conn, _params) do
    json conn, Athena.Debugger.execute_query()
  end

  # Call example: http://localhost:8000/getTestQueryResponse?query_uid=%228def5337-7e6d-4ab9-8092-1671d2e83c73%22
  def get_test_query_response(conn, %{"query_uid" => id}) do
    json conn, Athena.Debugger.execute_query_and_get_response()
  end

end
