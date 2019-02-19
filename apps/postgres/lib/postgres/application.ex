defmodule Postgres.Application do
  use Application

  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    children = [
      supervisor(Postgres.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Postgres.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
