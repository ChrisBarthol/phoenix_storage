defmodule Storage.LocationUserController do
  use Storage.Web, :controller

  alias Storage.LocationUser

  plug :scrub_params, "location_user" when action in [:create, :update]

  def index(conn, _params) do
    location_users = Repo.all(LocationUser)
    render(conn, "index.html", location_users: location_users)
  end

  def new(conn, _params) do
    changeset = LocationUser.changeset(%LocationUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location_user" => location_user_params}) do
    changeset = LocationUser.changeset(%LocationUser{}, location_user_params)

    case Repo.insert(changeset) do
      {:ok, _location_user} ->
        conn
        |> put_flash(:info, "Location user created successfully.")
        |> redirect(to: location_user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location_user = Repo.get!(LocationUser, id)
    render(conn, "show.html", location_user: location_user)
  end

  def edit(conn, %{"id" => id}) do
    location_user = Repo.get!(LocationUser, id)
    changeset = LocationUser.changeset(location_user)
    render(conn, "edit.html", location_user: location_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location_user" => location_user_params}) do
    location_user = Repo.get!(LocationUser, id)
    changeset = LocationUser.changeset(location_user, location_user_params)

    case Repo.update(changeset) do
      {:ok, location_user} ->
        conn
        |> put_flash(:info, "Location user updated successfully.")
        |> redirect(to: location_user_path(conn, :show, location_user))
      {:error, changeset} ->
        render(conn, "edit.html", location_user: location_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location_user = Repo.get!(LocationUser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(location_user)

    conn
    |> put_flash(:info, "Location user deleted successfully.")
    |> redirect(to: location_user_path(conn, :index))
  end
end
