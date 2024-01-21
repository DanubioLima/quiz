defmodule QuizApp.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :title, :text, null: false
      add :type, :text, null: false, default: "text"

      timestamps(type: :utc_datetime)
    end
  end
end
