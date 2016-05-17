defmodule Storage.Container do
  use Storage.Web, :model

  schema "conatiners" do

    belongs_to :locations, Storage.Location
    belongs_to :user, Storage.User
    belongs_to :substance, Storage.Substance

    # field :location_id, references(:locations)
    # field :user_id, references(:users)
    # field :substance_id, references(:substances)
    field :full_amount, :float
    field :warning_amount, :float
    field :name, :string

    timestamps
  end

end
