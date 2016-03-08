defmodule Storage.LocationUserTest do
  use Storage.ModelCase

  alias Storage.LocationUser

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LocationUser.changeset(%LocationUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LocationUser.changeset(%LocationUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
