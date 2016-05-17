defmodule Storage.Log do
  use Storage.Web, :model

  schema "logs" do
    belongs_to :substance, Storage.Substance
    belongs_to :container, Storage.Container

    field :raw_value, :float

    timestamps
  end

end
