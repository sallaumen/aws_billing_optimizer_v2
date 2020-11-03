defmodule Debug.Envs do

  def test_envs() do
    [
      Application.get_env(:ex_aws, :access_key_id),
      Application.get_env(:ex_aws, :secret_access_key),
      Application.get_env(:abo, :athena_url),
      Application.get_env(:abo, :athena_region),
    ]
  end

end
