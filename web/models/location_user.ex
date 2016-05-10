defmodule Storage.LocationUser do
  use Storage.Web, :model

  schema "location_users" do
    field :location_id, references(:locations)
    field :user_id, references(:users)

    timestamps
  end

end
