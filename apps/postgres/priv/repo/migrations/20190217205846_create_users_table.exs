defmodule Postgres.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :email, :string
      add :role, :string
      add :token, :string
      add :phone_number, :string
      add :avatar_url, :string
      add :name, :string

      timestamps()
    end
  end
end
