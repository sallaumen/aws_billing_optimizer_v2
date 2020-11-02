use Mix.Config

#config :ex_aws,
#       access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
#       secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role]

config :phoenix, :json_library, Poison


#config :abp, [
#  scheduler_interval_milli: 30_000,
#  sql_provider: &Ecto.Adapters.SQL.query/4,
#]

#config :abp, ABP.Travis, [
#  token: System.get_env("TRAVIS_API_TOKEN"),
#]

import_config "#{Mix.env}.exs"
