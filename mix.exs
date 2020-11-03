defmodule Abo.MixProject do
  use Mix.Project

  def project do
    [
      app: :abo,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.7"},
      {:hackney, "~> 1.9"},
      {:sweet_xml, "~> 0.6"},
      {:phoenix, "~> 1.5.4"},
      {:phoenix_live_dashboard, "~> 0.2"},
      {:ecto, "~> 3.5"},
      {:faker, "~> 0.15", only: :test}
      # {:absinthe, "~> 1.5.0"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
