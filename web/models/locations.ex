defmodule Storage.Locations do
  use Storage.Web, :model

  schema "locations" do
    field :name, :string
    field :address, :string
    field :city, :string
    field :zip_code, :integer
    field :state, :string

    timestamps
  end

end
