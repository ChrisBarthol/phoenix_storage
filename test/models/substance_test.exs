defmodule Storage.SubstanceTest do
  use Storage.ModelCase

  alias Storage.Substance

  @valid_attrs %{caloric_denisty: "120.5", density: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Substance.changeset(%Substance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Substance.changeset(%Substance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
