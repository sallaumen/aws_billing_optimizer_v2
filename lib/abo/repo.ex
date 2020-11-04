defmodule Abo.Repo do
  use Ecto.Repo,
    otp_app: :abo,
    adapter: Ecto.Adapters.Postgres
end
