defmodule TasktrackerWeb.Router do
  use TasktrackerWeb, :router

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

  scope "/", TasktrackerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users", PageController, :index
    get "/register", PageController, :index
    get "/newTask", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TasktrackerWeb do
  #   pipe_through :api
  # end
  scope "/api/v1", TasktrackerWeb do
     pipe_through :api
     resources "/tasks", TaskController, except: [:new, :edit]
     resources "/users", UserController, except: [:new, :edit]
     resources "/manages", ManageController, except: [:new, :edit]
     resources "/blocks", TimeBlocksController, except: [:new, :edit]
     post "/token", TokenController, :create
   end
end
