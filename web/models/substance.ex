defmodule Storage.Substance do
  use Storage.Web, :model

  schema "substances" do
    field :name, :string
    field :density, :float
    field :caloric_denisty, :float
    has_many :containers, Storage.Container

    timestamps
  end

  @required_fields ~w(name density caloric_denisty)
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
