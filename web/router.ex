defmodule CoverMyPingPong.Router do
  use CoverMyPingPong.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CoverMyPingPong do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/matches", GameController, only: [:index, :new, :create]
    resources "/users", UserController, except: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoverMyPingPong do
  #   pipe_through :api
  # end
end
