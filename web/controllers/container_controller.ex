defmodule Storage.ContainerController do
  use Storage.Web, :controller

  alias Storage.Container
  alias Storage.ContainerUser

  def all(conn, _params) do
    containers = Repo.all(Storage.Container)
    render conn, "index.html", containers: containers
  end

  def index(conn, _params, user) do
    containers = Repo.all(user_containers(user))
    render(conn, "index.html", containers: containers)
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get(Storage.Container, id)
    render conn, "show.html", container: container
  end

  def create(conn, %{"container"=>container_params}, user) do
    changeset =
      user
      |> build_assoc(:user_containers)
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
      |> build_assoc(:user_containers)
      |> Container.changeset()
    render conn, "new.html", changeset: changeset
  end

  def edit(conn, %{"id" => id}, user) do
    container = Repo.get!(user_containers(user), id)
    changeset = Container.changeset(container)
    render(conn, "edit.html", container: container, changeset: changeset)
  end

  def update(conn, %{"id" => id}, user) do
    container = Repo.get!(user_containers(user), id)
    changeset = Container.changeset(container, container_params)

    case Repo.update(changeset) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Container updated successfully")
        |> redriect(to: container_path(conn, :show, container))
      {:error, changeset} ->
        render(conn, "edit.html", container: conatiner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    container = Repo.get!(user_containers(user), id)
    Repo.delete!(container)

    conn
    |> put_flash(:info, "Container deleted successfully")
    |> redirect(to: container_path(conn, :index))
  end


  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [conn, conn.params, conn.assigns.current_user])
  end

  defp user_containers(user) do
    assoc(user, :containers)
  end
end
