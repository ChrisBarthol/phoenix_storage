defmodule Storage.Repo do
  use Ecto.Repo, otp_app: :storage
  # @moduledoc """
  # In memory repository.
  # """
#STUB OUT USER DATA
  # def all(Storage.User) do
  #   [
  #     %Storage.User{id: "1", name: "chris", email: "chris@test.com", password: "foobar"},
  #     %Storage.User{id: "2", name: "test", email: "test@test.com", password: "test"},
  #     %Storage.User{id: "3", name: "barthol", email: "barthol@test.com", password: "test"}
  #   ]
  # end
  # def all(_module), do: []
  #
  # def get(module, id) do
  #   Enum.find all(module), fn map -> map.id == id end
  # end
  #
  # def get_by(module, params) do
  #   Enum.find all(module), fn map ->
  #     Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
  #   end
  # end
end
