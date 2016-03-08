defmodule Storage.Container do
  use Storage.Web, :model

  schema "containers" do
    field :name, :string
    field :full_amount, :float
    field :warning_amount, :float
    field :last_filled, Ecto.Date
    belongs_to :location, Storage.Location
    belongs_to :substance, Storage.Substance
    has_many :logs, Storage.Log

    timestamps
  end

  @required_fields ~w(name full_amount warning_amount last_filled)
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
