defmodule Storage.SubstanceControllerTest do
  use Storage.ConnCase

  alias Storage.Substance
  @valid_attrs %{caloric_denisty: "120.5", density: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, substance_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing substances"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, substance_path(conn, :new)
    assert html_response(conn, 200) =~ "New substance"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, substance_path(conn, :create), substance: @valid_attrs
    assert redirected_to(conn) == substance_path(conn, :index)
    assert Repo.get_by(Substance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, substance_path(conn, :create), substance: @invalid_attrs
    assert html_response(conn, 200) =~ "New substance"
  end

  test "shows chosen resource", %{conn: conn} do
    substance = Repo.insert! %Substance{}
    conn = get conn, substance_path(conn, :show, substance)
    assert html_response(conn, 200) =~ "Show substance"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, substance_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    substance = Repo.insert! %Substance{}
    conn = get conn, substance_path(conn, :edit, substance)
    assert html_response(conn, 200) =~ "Edit substance"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    substance = Repo.insert! %Substance{}
    conn = put conn, substance_path(conn, :update, substance), substance: @valid_attrs
    assert redirected_to(conn) == substance_path(conn, :show, substance)
    assert Repo.get_by(Substance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    substance = Repo.insert! %Substance{}
    conn = put conn, substance_path(conn, :update, substance), substance: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit substance"
  end

  test "deletes chosen resource", %{conn: conn} do
    substance = Repo.insert! %Substance{}
    conn = delete conn, substance_path(conn, :delete, substance)
    assert redirected_to(conn) == substance_path(conn, :index)
    refute Repo.get(Substance, substance.id)
  end
end
