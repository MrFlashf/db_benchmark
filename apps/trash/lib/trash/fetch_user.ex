defmodule Trash.FetchUser do
  alias Trash.User

  def call(id) do
    Postgres.Repo.get(User, id)
  end
end
