defmodule QuizApp.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item) do
      add :title, :text, null: false
      add :type, :text, null: false, default: "text"
      add :question_id, references(:question, type: :uuid), null: false

      timestamps(type: :utc_datetime)
    end
  end
end
