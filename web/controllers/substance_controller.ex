defmodule Storage.SubstanceController do
  use Storage.Web, :controller

  alias Storage.Substance

  plug :scrub_params, "substance" when action in [:create, :update]

  def index(conn, _params) do
    substances = Repo.all(Substance)
    render(conn, "index.html", substances: substances)
  end

  def new(conn, _params) do
    changeset = Substance.changeset(%Substance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"substance" => substance_params}) do
    changeset = Substance.changeset(%Substance{}, substance_params)

    case Repo.insert(changeset) do
      {:ok, _substance} ->
        conn
        |> put_flash(:info, "Substance created successfully.")
        |> redirect(to: substance_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    substance = Repo.get!(Substance, id)
    render(conn, "show.html", substance: substance)
  end

  def edit(conn, %{"id" => id}) do
    substance = Repo.get!(Substance, id)
    changeset = Substance.changeset(substance)
    render(conn, "edit.html", substance: substance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "substance" => substance_params}) do
    substance = Repo.get!(Substance, id)
    changeset = Substance.changeset(substance, substance_params)

    case Repo.update(changeset) do
      {:ok, substance} ->
        conn
        |> put_flash(:info, "Substance updated successfully.")
        |> redirect(to: substance_path(conn, :show, substance))
      {:error, changeset} ->
        render(conn, "edit.html", substance: substance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    substance = Repo.get!(Substance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(substance)

    conn
    |> put_flash(:info, "Substance deleted successfully.")
    |> redirect(to: substance_path(conn, :index))
  end
end
