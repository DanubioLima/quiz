defmodule QuizApp.Repo.Migrations.CreateFormAnswers do
  use Ecto.Migration

  def change do
    create table(:form_answers) do
      add :form_id, references(:form, type: :uuid), null: false
      add :question_id, references(:question, type: :uuid), null: false
      add :correct_item_id, references(:item, type: :uuid), null: false

      timestamps(type: :utc_datetime)
    end
  end
end
