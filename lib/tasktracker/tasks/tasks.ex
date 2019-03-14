defmodule Tasktracker.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Tasktracker.Repo
  alias Tasktracker.Users
  alias Tasktracker.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
    |> Repo.preload(:user)
  end

  def list_assigned_tasks do
    Repo.all(from t in Task, where: not is_nil(t.user_id))
    |> Repo.preload(:user)
  end



  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id) |> Repo.preload(:user)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end

  alias Tasktracker.Tasks.Manage

  def list_manages do
    Repo.all(Manage)
    |> Enum.map(&({&1.employee_id, &1.id}))
    |> Enum.into(%{})
  end

  def list_managers(user_id) do
    Repo.all(from m in Manage, where: m.employee_id == ^user_id)
    |> List.first()
    |> (fn f -> f || %{manager_id: -1} end).()
    |> (fn f -> Users.get_user(f.manager_id) end).()
    |> (fn f -> [f] end).()
  end

  def list_employees_id(user_id) do
    Repo.all(from m in Manage, where: m.manager_id == ^user_id, select: m.employee_id)
  end

  def list_employees(user_id) do
    Repo.all(from m in Manage,
      where: m.manager_id == ^user_id)
    |> Enum.map(&({&1.employee_id, &1.id}))
    |> Enum.into(%{})
  end

  def get_manage!(id), do: Repo.get!(Manage, id)

  def create_manage(attrs \\ %{}) do
    %Manage{}
    |> Manage.changeset(attrs)
    |> Repo.insert()
  end

  def update_manage(%Manage{} = manage, attrs) do
    manage
    |> Manage.changeset(attrs)
    |> Repo.update()
  end

  def delete_manage(%Manage{} = manage) do
    Repo.delete(manage)
  end

  def change_manage(%Manage{} = manage) do
    Manage.changeset(manage, %{})
  end
end
