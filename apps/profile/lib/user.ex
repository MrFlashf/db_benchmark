defmodule Profile.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :phone_number, :string
    field :avatar_url, :string
    field :name, :string
  end

  @fields ~w(username email phone_number avatar_url name)

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate()
  end

  def validate(changeset), do: changeset
end
