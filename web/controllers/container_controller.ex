defmodule Storage.ContainerController do
  use Storage.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get(Storage.Container, id)
    render conn, "show.html", container: container
  end

  def create(conn, %{"container"=>container_params}) do
    changeset = Container.create_changeset(%Container{}, container_params)
    case Repo.insert(changeset) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "#{container.name} created!")
        |> redirect(to: container_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = Container.changeset(%Container{})
    render conn, "new.html", changeset: changeset
  end
end
