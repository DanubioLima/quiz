defmodule QuizApp.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :title, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
