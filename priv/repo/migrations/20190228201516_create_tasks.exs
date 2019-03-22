defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :desc, :text
      add :status, :string
      add :time, :integer

      timestamps()
    end

    create constraint("tasks", :time_spent_must_be_15_minute_increments, check: "(time % 15) = 0")
  end
end
