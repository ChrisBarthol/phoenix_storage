defmodule Storage.PageController do
  use Storage.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
