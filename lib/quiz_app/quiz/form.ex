defmodule QuizApp.Quiz.Form do
  @moduledoc """
  Form schema
  """
  use QuizApp.Schema
  use SwissSchema, repo: QuizApp.Repo
  import Ecto.Changeset

  alias QuizApp.Quiz.Question

  schema "form" do
    field :name, :string

    has_many :questions, Question

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
