defmodule Storage.Substance do
  use Storage.Web, :model

  schema "substances" do
    has_many :logs, Storage.Log
    has_many :containers, Storage.Container
    
    field :density, :float
    field :caloric_density, :float
    field :name, :string

    timestamps
  end

end
