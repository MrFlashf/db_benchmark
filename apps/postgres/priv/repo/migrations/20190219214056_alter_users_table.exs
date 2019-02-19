defmodule Postgres.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :string1, :string
      add :string2, :string
      add :string3, :string
      add :string4, :string
      add :string5, :string
      add :string6, :string
      add :string7, :string
      add :string8, :string
      add :string9, :string
      add :string10, :string
      add :integer1, :integer
      add :integer2, :integer
      add :integer3, :integer
      add :integer4, :integer
      add :integer5, :integer
      add :integer6, :integer
      add :integer7, :integer
      add :integer8, :integer
      add :integer9, :integer
      add :integer10, :integer
    end
  end
end
