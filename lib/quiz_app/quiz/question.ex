defmodule QuizApp.Quiz.Question do
  use QuizApp.Schema
  use SwissSchema, repo: QuizApp.Repo
  import Ecto.Changeset

  alias QuizApp.Quiz.{Form, Item}

  schema "question" do
    field :type, :string, default: "text"
    field :title, :string

    belongs_to :form, Form
    has_many :item, Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :type, :form_id])
    |> validate_required([:title, :type, :form_id])
  end
end
