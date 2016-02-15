defmodule Storage.UserView do
  use Storage.Web, :view
  alias Storage.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
