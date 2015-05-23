defmodule TwitterPlayground.Router do
  use TwitterPlayground.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TwitterPlayground do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", TwitterPlayground do
    channel "tweets", TweetsChannel
  end

  # Other scopes may use custom stacks.
  # scope "/api", TwitterPlayground do
  #   pipe_through :api
  # end
end
