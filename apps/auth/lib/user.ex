defmodule Auth.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string
    field :email, :string
  end

  @fields ~w(username password email)

  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate()
  end

  def validate(changeset), do: changeset
end
