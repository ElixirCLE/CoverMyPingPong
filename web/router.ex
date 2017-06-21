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

    get "/matches", GameController, :index
    get "/matches/new", GameController, :new
    post "/matches/new", GameController, :create


    get "/users", UserController, :index
    get "/users/new", UserController, :new
    post "/users/new", UserController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoverMyPingPong do
  #   pipe_through :api
  # end
end
