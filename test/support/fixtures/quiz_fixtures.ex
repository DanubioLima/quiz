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
end
