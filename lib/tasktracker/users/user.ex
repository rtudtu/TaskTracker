defmodule Tasktracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tasks.Manage
  alias Tasktracker.Users.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :pw_tries, :integer
    field :pw_last_try, :utc_datetime
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    has_one :manager, Manage, foreign_key: :manager_id
    has_many :employees, Manage, foreign_key: :employee_id

    timestamps()
  end



  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> validate_password(:password)
    |> put_pass_hash()
    |> validate_required([:email, :name, :password_hash])
  end

  # *From Comeonin docs*
  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  def put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end
  def put_pass_hash(changeset), do: changeset

  def valid_password?(password) when byte_size(password) > 7 do
    {:ok, password}
  end
  def valid_password?(_), do: {:error, "Password must be at least 7 characters long."}
end
