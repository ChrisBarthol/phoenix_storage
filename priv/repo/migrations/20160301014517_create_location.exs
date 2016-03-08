defmodule Storage.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :zip_code, :integer
      add :state, :string

      timestamps
    end

  end
end
