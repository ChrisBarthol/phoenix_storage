defmodule Storage.SessionController do
  use Storage.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => user, "password"=> pass}}) do
    case Storage.Auth.login_by_email_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Storage.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
