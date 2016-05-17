defmodule Storage.Repo.Migrations.AddBasicTables do
  use Ecto.Migration

  def up do
    create table(:locations) do
      add :name, :string , null: false
      add :address, :string
      add :city, :string
      add :zip_code, :integer
      add :state, :string

      timestamps
    end

    create table(:substances) do
      add :name, :string, null: false
      add :density, :float
      add :caloric_density, :float

      timestamps
    end

    create table(:location_users) do
      add :user_id, references(:users)
      add :location_id, references(:locations)

      timestamps
    end

    create table(:containers) do
      add :location_id, references(:locations)
      add :substance_id, references(:substances)
      add :name, :string, null: false
      add :full_amount, :float
      add :warning_amount, :float
      add :last_filled, :date

      timestamps
    end

    create table(:container_users) do
      add :user_id, references(:users)
      add :container_id, references(:containers)

      timestamps
    end

    create table(:logs) do
      add :container_id, references(:locations)
      add :subtance_id, references(:substances)
      add :raw_value, :float

      timestamps
    end

    create table(:raw_data) do
      add :container_id, :integer
      add :raw_value, :float
      add :logged_at, :date

      timestamps
    end

  end

  def down do
    drop table(:location_users)
    drop table(:container_users)
    drop table(:containers)
    drop table(:logs)
    drop table(:locations)
    drop table(:substances)
    drop table(:raw_data)
  end
end
