defmodule Storage.Substance do
  use Storage.Web, :model

  schema "substances" do
    field :density, :float
    field :caloric_density, :float
    field :name, :string

    timestamps
  end

end
