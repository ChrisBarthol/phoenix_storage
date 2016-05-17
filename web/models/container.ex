defmodule Storage.Container do
  use Storage.Web, :model

  schema "conatiners" do
    belongs_to :locations, Storage.Location
    belongs_to :substance, Storage.Substance
    has_many :logs, Storage.Log
    has_many :container_users, Storage.ContainerUser

    field :full_amount, :float
    field :warning_amount, :float
    field :name, :string

    timestamps
  end

end
