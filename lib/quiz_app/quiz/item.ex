defmodule QuizApp.Quiz.Item do
  use QuizApp.Schema
  import Ecto.Changeset

  schema "item" do
    field :type, :string, default: "text"
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :type])
    |> validate_required([:title, :type])
  end
end
