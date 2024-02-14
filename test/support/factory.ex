defmodule QuizApp.Factory do
  @moduledoc """
  Defines the factories for tests
  """

  use ExMachina.Ecto, repo: QuizApp.Repo

  alias QuizApp.Quiz.{Question, Item, Form}

  def form_factory do
    %Form{
      name: sequence(:name, &"-#{&1}")
    }
  end

  def question_factory do
    %Question{
      title: sequence(:title, &"-#{&1}")
    }
  end

  def item_factory do
    %Item{
      title: sequence(:title, &"-#{&1}")
    }
  end
end
