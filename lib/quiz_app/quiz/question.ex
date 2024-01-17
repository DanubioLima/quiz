defmodule QuizApp.Quiz.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :type, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :type])
    |> validate_required([:title, :type])
  end
end
