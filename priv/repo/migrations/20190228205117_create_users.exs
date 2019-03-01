defmodule Tasktracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string

      timestamps()
    end
    alter table(:tasks) do
      add :user_id, references(:users, on_delete: :delete_all), null: true
    end
  end
end
