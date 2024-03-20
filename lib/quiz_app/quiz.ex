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
        question_id = answer["question_id"]

        %{correct_item_id: correct_item_id} =
          FormAnswers.get_by!(%{form_id: form_id, question_id: question_id})

        user_answer = %{
          form_id: form_id,
          question_id: question_id,
          correct_item_id: correct_item_id,
          user_item_id: answer["user_item_id"]
        }

        insert_or_update_user_answer(user_answer)
      end)
    end)
  end

  defp insert_or_update_user_answer(params) do
    %{
      form_id: form_id,
      question_id: question_id,
      correct_item_id: correct_item_id,
      user_item_id: user_item_id
    } = params

    case get_user_answer(form_id, question_id) do
      nil ->
        UserAnswers.insert!(%{
          form_id: form_id,
          question_id: question_id,
          correct_item_id: correct_item_id,
          user_item_id: user_item_id
        })

      user_answer ->
        user_answer
        |> UserAnswers.update!(%{
          form_id: form_id,
          question_id: question_id,
          correct_item_id: correct_item_id,
          user_item_id: user_item_id
        })
    end
  end

  defp get_user_answer(form_id, question_id) do
    UserAnswers
    |> where([u], u.form_id == ^form_id and u.question_id == ^question_id)
    |> Repo.one()
  end

  def list_user_answers_by_form(form_id) do
    UserAnswers
    |> where([u], u.form_id == ^form_id)
    |> order_by(desc: :inserted_at)
    |> preload([:form, :question, :user_item, :correct_item])
    |> Repo.all()
  end
end
