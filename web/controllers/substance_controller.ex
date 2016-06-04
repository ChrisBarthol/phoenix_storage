defmodule Storage.SubstanceController do
  user Storage.Web, :controller

  alias Storage.Substance

  def index(conn, _params) do
    substances = Repo.all(Storage.Substance)
    render conn, "index.html", substances: substances
  end

  def show(conn, %{"id" -> id}) do
    substance = Repo.get(Storage.Substance, id)
    render conn, "show.html", substance: substance
  end

  def new(conn, _params) do
    changeset = Substance.changeset(%Substance{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"substance"=>substance_params}) do
    changeset = Substance.create_changeset(%Substance{}, substance_params)
    case Repo.insert(changeset) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "#{substance.name} created!")
        |> redirect(to: substance_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
      end
    end
end
