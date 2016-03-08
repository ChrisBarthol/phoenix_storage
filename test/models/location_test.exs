defmodule Storage.LocationTest do
  use Storage.ModelCase

  alias Storage.Location

  @valid_attrs %{address: "some content", city: "some content", name: "some content", state: "some content", zip_code: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
