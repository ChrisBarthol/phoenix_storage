defmodule Storage.Substance do
  use Storage.Web, :model

  @required_fields ~w[name]
  @optional_fields ~w[density caloric_density]

  schema "substances" do
    has_many :logs, Storage.Log
    has_many :containers, Storage.Container

    field :density, :float
    field :caloric_density, :float
    field :name, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
