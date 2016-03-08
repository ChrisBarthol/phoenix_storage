defmodule Storage.Repo.Migrations.CreateContainer do
  use Ecto.Migration

  def change do
    create table(:containers) do
      add :name, :string
      add :full_amount, :float
      add :warning_amount, :float
      add :last_filled, :date
      add :location_id, references(:locations, on_delete: :nothing)
      add :substance_id, references(:substances, on_delete: :nothing)

      timestamps
    end
    create index(:containers, [:location_id])
    create index(:containers, [:substance_id])

  end
end
