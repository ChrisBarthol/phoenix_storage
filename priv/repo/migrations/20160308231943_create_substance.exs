defmodule Storage.Repo.Migrations.CreateSubstance do
  use Ecto.Migration

  def change do
    create table(:substances) do
      add :name, :string
      add :density, :float
      add :caloric_denisty, :float

      timestamps
    end

  end
end
