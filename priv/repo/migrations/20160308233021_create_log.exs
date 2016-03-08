defmodule Storage.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :time, :date
      add :raw_value, :float
      add :container_id, references(:containers, on_delete: :nothing)

      timestamps
    end
    create index(:logs, [:container_id])

  end
end
