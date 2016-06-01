defmodule Storage.Container do
  use Storage.Web, :model

  @required_fields ~w(name)
  @optional_fields ~w(full_amount warning_amount)

  schema "containers" do
    belongs_to :locations, Storage.Location
    belongs_to :substance, Storage.Substance
    has_many :logs, Storage.Log
    has_many :container_users, Storage.ContainerUser
    has_many :users, through: [:container_users, :user]

    field :full_amount, :float
    field :warning_amount, :float
    field :name, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def create_changeset(model, params) do
    model
    |> changset(params)
    |> validate_length(:name, min: 1, max: 100)
  end

end
