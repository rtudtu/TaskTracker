defmodule Tasktracker.Tasks.Manage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasks.Manage


  schema "manages" do
    field :manager_id, :id
    field :employee_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Manage{} = manage, attrs) do
    manage
    |> cast(attrs, [:manager_id, :employee_id])
    |> validate_required([:manager_id, :employee_id])
  end
end
