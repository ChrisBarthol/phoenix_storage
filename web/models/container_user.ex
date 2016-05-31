defmodule Storage.ContainerUser do
  use Storage.Web, :model

  schema "container_users" do
    belongs_to :container, Storage.Container
    belongs_to :user, Storage.User

    timestamps
  end

end
