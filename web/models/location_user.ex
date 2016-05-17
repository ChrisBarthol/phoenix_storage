defmodule Storage.LocationUser do
  use Storage.Web, :model

  schema "location_users" do
    belongs_to :locations, Storage.Location
    belongs_to :users, Storage.User

    timestamps
  end

end
