defmodule UnusedSchema.TestSchema do
  use Ecto.Schema

  schema "users" do
    field(:name, :string)
    field(:username, :string, default: "vdv")
    field :hides, {:array, :string}, default: []

  end
end
