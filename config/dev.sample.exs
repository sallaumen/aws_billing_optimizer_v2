use Mix.Config

config :ex_aws,
  access_key_id: "YOUR_KEY_HERE",
  secret_access_key: "YOUR_PASS_HERE",
  debug_requests: false

config :aws_athena,
   athena_url: "ATHENA_URL",
   athena_region: "ATHENA_REGION"
