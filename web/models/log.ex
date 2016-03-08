defmodule Storage.Log do
  use Storage.Web, :model

  schema "logs" do
    field :time, Ecto.Date
    field :raw_value, :float
    belongs_to :container, Storage.Container

    timestamps
  end

  @required_fields ~w(time raw_value)
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
