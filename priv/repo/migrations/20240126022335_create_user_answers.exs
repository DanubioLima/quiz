defmodule QuizApp.Repo.Migrations.CreateUserAnswers do
  use Ecto.Migration

  def change do
    create table(:user_answers) do
      add :form_id, references(:form, type: :uuid), null: false
      add :question_id, references(:question, type: :uuid), null: false
      add :user_item_id, references(:item, type: :uuid), null: false
      add :correct_item_id, references(:item, type: :uuid), null: false

      timestamps(type: :utc_datetime)
    end
  end
end
