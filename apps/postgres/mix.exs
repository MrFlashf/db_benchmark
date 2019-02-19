defmodule Postgres.MixProject do
  use Mix.Project

  def project do
    [
      app: :postgres,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Postgres.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:postgrex, "~> 0.14.0"},
      {:ecto_sql, "~> 3.0"},
      # {:ecto, "~> 3.0"}
    ]
  end
end
