defmodule Storage.Locations do
  use Storage.Web, :model

  schema "locations" do
    has_many :location_users, Storage.LocationUser
    has_many :containers, Storage.Container

    field :name, :string
    field :address, :string
    field :city, :string
    field :zip_code, :integer
    field :state, :string


    timestamps
  end

end
