defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def redirect_task(conn, _params) do
    conn
    |> redirect(to: "/users")
  end
end
