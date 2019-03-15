defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller
  alias Tasktracker.Users
  alias Tasktracker.Users.User

  def index(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "index.html", changeset: changeset)
  end

  def redirect_task(conn, _params) do
    conn
    |> redirect(to: "/users")
  end
end
