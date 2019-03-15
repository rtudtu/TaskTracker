defmodule Tasktracker.Repo.Migrations.CreateBlocks do
  use Ecto.Migration

  def change do
    create table(:blocks) do
      add :start, :string, null: false
      add :end, :string, null: false
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:blocks, [:task_id])
  end
end
