defmodule Storage.ContainerController do
  use Storage.Web, :controller

  alias Storage.Container
  alias Storage.ContainerUser

  def index(conn, _params) do
    containers = Repo.all(Storage.Container)
    render conn, "index.html", containers: containers
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get(Storage.Container, id)
    render conn, "show.html", container: container
  end

  def create(conn, %{"container"=>container_params}, user) do
    changeset =
      user
      |> build_assoc(:container_users)
      |> Container.changset(container_params)

    case Repo.insert(changeset) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "#{container.name} created!")
        |> redirect(to: container_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:container_users)
      |> Container.changeset()
    render conn, "new.html", changeset: changeset
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [conn, conn.params, conn.assigns.current_user])
  end

  defp user_containers(user) do
    assoc(user, :containers)
  end
end
