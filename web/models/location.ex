defmodule Storage.Location do
  use Storage.Web, :model

  schema "locations" do
    field :name, :string
    field :address, :string
    field :city, :string
    field :zip_code, :integer
    field :state, :string
    has_many :location_users, Storage.LocationUser
    has_many :containers, Storage.Container

    timestamps
  end

  @required_fields ~w(name address city zip_code state)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
