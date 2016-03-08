defmodule Storage.LocationUserControllerTest do
  use Storage.ConnCase

  alias Storage.LocationUser
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, location_user_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing location users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, location_user_path(conn, :new)
    assert html_response(conn, 200) =~ "New location user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, location_user_path(conn, :create), location_user: @valid_attrs
    assert redirected_to(conn) == location_user_path(conn, :index)
    assert Repo.get_by(LocationUser, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, location_user_path(conn, :create), location_user: @invalid_attrs
    assert html_response(conn, 200) =~ "New location user"
  end

  test "shows chosen resource", %{conn: conn} do
    location_user = Repo.insert! %LocationUser{}
    conn = get conn, location_user_path(conn, :show, location_user)
    assert html_response(conn, 200) =~ "Show location user"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, location_user_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    location_user = Repo.insert! %LocationUser{}
    conn = get conn, location_user_path(conn, :edit, location_user)
    assert html_response(conn, 200) =~ "Edit location user"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    location_user = Repo.insert! %LocationUser{}
    conn = put conn, location_user_path(conn, :update, location_user), location_user: @valid_attrs
    assert redirected_to(conn) == location_user_path(conn, :show, location_user)
    assert Repo.get_by(LocationUser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    location_user = Repo.insert! %LocationUser{}
    conn = put conn, location_user_path(conn, :update, location_user), location_user: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit location user"
  end

  test "deletes chosen resource", %{conn: conn} do
    location_user = Repo.insert! %LocationUser{}
    conn = delete conn, location_user_path(conn, :delete, location_user)
    assert redirected_to(conn) == location_user_path(conn, :index)
    refute Repo.get(LocationUser, location_user.id)
  end
end
