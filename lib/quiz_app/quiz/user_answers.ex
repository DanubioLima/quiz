defmodule QuizApp.Quiz.UserAnswers do
  use QuizApp.Schema
  use SwissSchema, repo: QuizApp.Repo
  import Ecto.Changeset

  alias QuizApp.Quiz.{Form, Question, Item}

  schema "user_answers" do
    belongs_to :form, Form
    belongs_to :question, Question
    belongs_to :user_item, Item
    belongs_to :correct_item, Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_answers, attrs) do
    user_answers
    |> cast(attrs, [:form_id, :question_id, :user_item_id, :correct_item_id])
    |> validate_required([:form_id, :question_id, :user_item_id, :correct_item_id])
  end
end
