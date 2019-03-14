defmodule Tasktracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasks.Manage


  schema "users" do
    field :email, :string
    field :name, :string
    has_one :manager, Manage, foreign_key: :manager_id
    has_many :employees, Manage, foreign_key: :employee_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> unique_constraint(:email)
    |> validate_required([:email, :name])
  end
end
