defmodule Storage.ContainerTest do
  use Storage.ModelCase

  alias Storage.Container

  @valid_attrs %{full_amount: "120.5", last_filled: "2010-04-17", name: "some content", warning_amount: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Container.changeset(%Container{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Container.changeset(%Container{}, @invalid_attrs)
    refute changeset.valid?
  end
end
