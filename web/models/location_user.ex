defmodule Storage.LocationUser do
  use Storage.Web, :model

  schema "location_users" do
    belongs_to :locations, Storage.Location
    belongs_to :users, Storage.User

    # field :location_id, references(:locations)
    # field :user_id, references(:users)

    timestamps
  end

end
