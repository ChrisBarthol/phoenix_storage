defmodule Storage.Repo.Migrations.CreateLocationUser do
  use Ecto.Migration

  def change do
    create table(:location_users) do
      add :user_id, references(:users, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps
    end
    create index(:location_users, [:user_id])
    create index(:location_users, [:location_id])

  end
end
