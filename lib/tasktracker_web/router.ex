defmodule TasktrackerWeb.Router do
  use TasktrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TasktrackerWeb.Plugs.FetchSession
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
    resources "/tasks", TaskController
    resources "/users", UserController
    post "/token", TokenController, :create
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
    get "/tasks/:manager_id/tasks", TaskController, :tasks
  end

  # Other scopes may use custom stacks.
  # scope "/api", TasktrackerWeb do
  #   pipe_through :api
  # end
  scope "/api/v1", TasktrackerWeb do
     pipe_through :api
     resources "/manages", ManageController, except: [:new, :edit]
     resources "/blocks", TimeBlocksController, except: [:new, :edit]
   end
end
