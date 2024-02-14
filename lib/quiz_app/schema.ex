defmodule QuizApp.Schema do
  @moduledoc """
  Default QuizApp schema that uses Ecto Schema with some configurations
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @schema_prefix "public"
      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end
end
