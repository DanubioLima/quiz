defmodule QuizApp.Quiz do
  @moduledoc """
  The Quiz context.
  """

  import Ecto.Query, warn: false
  alias QuizApp.Quiz.FormAnswers
  alias QuizApp.Repo

  alias QuizApp.Quiz.{UserAnswers, Form}

  @doc """
  Returns a form or raise an exception if not found.
  """
  def get_form!(form_id) do
    Repo.get!(Form, form_id)
    |> Repo.preload(questions: :items)
  end

  def list_form() do
    Form.all()
  end

  def save_user_answers(answers, form_id) do
    Repo.transaction(fn ->
      Enum.each(answers, fn answer ->
        %{correct_item_id: correct_item_id} =
          FormAnswers.get_by!(%{form_id: form_id, question_id: answer["question_id"]})

        UserAnswers.insert!(%{
          form_id: form_id,
          question_id: answer["question_id"],
          correct_item_id: correct_item_id,
          user_item_id: answer["user_item_id"]
        })
      end)
    end)
  end

  def list_user_answers_by_form(form_id) do
    UserAnswers
    |> where([u], u.form_id == ^form_id)
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end
end
