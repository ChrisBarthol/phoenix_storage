defmodule Storage.ContainerController do
  use Storage.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get(Storage.Container, id)
    render conn, "show.html", container: container
  end
end
