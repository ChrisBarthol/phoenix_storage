defmodule Storage.UserController do
  use Storage.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Storage.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Storage.User, id)
    render conn, "show.html", user: user
  end
end
