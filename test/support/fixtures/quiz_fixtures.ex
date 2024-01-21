defmodule QuizApp.QuizFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuizApp.Quiz` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        title: "some title",
        type: "some type"
      })
      |> QuizApp.Quiz.create_question()

    question
  end

  @doc """
  Generate a form.
  """
  def form_fixture(attrs \\ %{}) do
    {:ok, form} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> QuizApp.Quiz.create_form()

    form
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        title: "some title",
        type: "some type"
      })
      |> QuizApp.Quiz.create_item()

    item
  end

  @doc """
  Generate a form__answers.
  """
  def form__answers_fixture(attrs \\ %{}) do
    {:ok, form__answers} =
      attrs
      |> Enum.into(%{
        correct_item_id: "7488a646-e31f-11e4-aace-600308960662",
        form_id: "7488a646-e31f-11e4-aace-600308960662",
        question_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> QuizApp.Quiz.create_form__answers()

    form__answers
  end
end
