defmodule QuizApp.Quiz.Item do
  @moduledoc """
  Item schema
  """
  use QuizApp.Schema
  use SwissSchema, repo: QuizApp.Repo
  import Ecto.Changeset

  alias QuizApp.Quiz.Question

  schema "item" do
    field :type, :string, default: "text"
    field :title, :string

    belongs_to :question, Question

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :type, :question_id])
    |> validate_required([:title, :type, :question_id])
  end
end
