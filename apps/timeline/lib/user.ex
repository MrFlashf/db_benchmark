defmodule Timeline.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :username, :string
    field :avatar_url, :string
  end
end
