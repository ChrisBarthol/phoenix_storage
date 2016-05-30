defmodule Storage.Router do
  use Storage.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Storage.Auth, repo: Storage.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Storage do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/containers", ContainerController, only: [:new, :show]
    resources "/substances", SubstanceController, only: [:new, :show, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Storage do
  #   pipe_through :api
  # end
end
