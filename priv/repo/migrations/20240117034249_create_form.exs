defmodule QuizApp.Repo.Migrations.CreateForm do
  use Ecto.Migration

  def change do
    create table(:form) do
      add :name, :text, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
