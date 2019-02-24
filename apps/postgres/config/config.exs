use Mix.Config

config :postgres, Postgres.Repo,
  database: "db_test",
  username: "krzychu",
  password: "",
  hostname: "localhost",
  log: false

# and its dependencies with the aid of the Mix.Config module.
