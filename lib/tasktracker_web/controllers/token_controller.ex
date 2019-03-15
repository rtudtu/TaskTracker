defmodule TasktrackerWeb.TokenController do
  use TasktrackerWeb, :controller
  alias Tasktracker.Users.User

  def create(conn, %{"email" => email, "pass" => pass}) do
    with {:ok, %User{} = user} <- Tasktracker.Users.auth_user(email, pass) do
      token = Phoenix.Token.sign(conn, "auth token", user.id)
      conn
      |> put_status(:created)
      |> render("token.json", user: user, token: token)
    end
  end

end
