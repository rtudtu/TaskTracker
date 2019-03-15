defmodule TasktrackerWeb.TimeBlocksController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tasks
  alias Tasktracker.Tasks.TimeBlocks

  def index(conn, _params) do
    blocks = Tasks.list_blocks()
    render(conn, "index.json", blocks: blocks)
  end

  def create(conn, %{"time_blocks" => time_blocks_params}) do
    with {:ok, %TimeBlocks{} = time_blocks} <- Tasks.create_time_blocks(time_blocks_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.time_blocks_path(conn, :show, time_blocks))
      |> render("show.json", time_blocks: time_blocks)
    end
  end

  def show(conn, %{"id" => id}) do
    time_blocks = Tasks.get_time_blocks!(id)
    render(conn, "show.json", time_blocks: time_blocks)
  end

  def update(conn, %{"id" => id, "time_blocks" => time_blocks_params}) do
    time_blocks = Tasks.get_time_blocks!(id)

    with {:ok, %TimeBlocks{} = time_blocks} <- Tasks.update_time_blocks(time_blocks, time_blocks_params) do
      render(conn, "show.json", time_blocks: time_blocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_blocks = Tasks.get_time_blocks!(id)
    with {:ok, %TimeBlocks{}} <- Tasks.delete_time_blocks(time_blocks) do
      send_resp(conn, :no_content, "")
    end
  end
end
