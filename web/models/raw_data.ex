defmodule Storage.RawData do
  use Storage.Web, :model

  schema "raw_data" do
    field :raw_value, :float
    field :container_id, :id
    field :logged_at, Ecto.Date

    timestamps
  end

end
