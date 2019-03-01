defmodule Tasktracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string
    field :name, :string
    field :status, :string
    field :time, :integer
    belongs_to :user, Tasktracker.Users.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :status, :time, :user_id])
    |> validate_required([:name, :desc])
  end
end
