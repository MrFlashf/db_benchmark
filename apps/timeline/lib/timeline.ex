defmodule Timeline do
  alias Trash.User

  def do_something(user_id) do
    Postgres.Repo.get(User, user_id)


  end
end
