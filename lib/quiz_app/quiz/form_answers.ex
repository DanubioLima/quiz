defmodule QuizApp.Quiz.FormAnswers do
  use QuizApp.Schema
  import Ecto.Changeset

  alias QuizApp.Quiz.{Form, Question, Item}

  schema "form_answers" do
    belongs_to :form, Form
    belongs_to :question, Question
    belongs_to :correct_item, Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(form_answers, attrs) do
    form_answers
    |> cast(attrs, [:form_id, :question_id, :correct_item_id])
    |> validate_required([:form_id, :question_id, :correct_item_id])
  end
end
