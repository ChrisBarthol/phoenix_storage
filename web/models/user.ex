defmodule Storage.User do
  use Storage.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :container_users, Storage.ContainerUser
    has_many :containers, through: [:container_users, :containers]

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name email), [])
    |> validate_length(:name, min: 1, max: 20)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> unique_constraint(:email)
    |> unique_constraint(:name)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
