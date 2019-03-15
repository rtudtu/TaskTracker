defmodule Tasktracker.Tasks.TimeBlocks do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasks.TimeBlocks


  schema "blocks" do
    field :end, :string
    field :start, :string
    field :task_id, :id

    timestamps()
  end

  @doc false
  def changeset(%TimeBlocks{} = time_blocks, attrs) do
    time_blocks
    |> cast(attrs, [:start, :end, :task_id])
    |> validate_required([:start, :end, :task_id])
  end
end
