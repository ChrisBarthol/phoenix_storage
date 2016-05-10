defmodule Storage.Log do
  use Storage.Web, :model

  schema "logs" do
    field :substance_id, references(:substances)
    field :container_id, references(:containers)
    field :raw_value, :float

    timestamps
  end

end
