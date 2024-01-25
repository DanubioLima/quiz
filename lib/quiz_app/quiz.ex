defmodule QuizApp.Quiz do
  @moduledoc """
  The Quiz context.
  """

  import Ecto.Query, warn: false
  alias QuizApp.Repo

  alias QuizApp.Quiz.Question

  @doc """
  Returns the list of question.

  ## Examples

      iex> list_question()
      [%Question{}, ...]

  """
  def list_question do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end

  alias QuizApp.Quiz.Form

  @doc """
  Returns the list of form.

  ## Examples

      iex> list_form()
      [%Form{}, ...]

  """
  def list_form() do
    Repo.all(Form)
  end

  @doc """
  Gets a single form.

  Raises `Ecto.NoResultsError` if the Form does not exist.

  ## Examples

      iex> get_form!(123)
      %Form{}

      iex> get_form!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form!(id), do: Repo.get!(Form, id)

  @doc """
  Creates a form.

  ## Examples

      iex> create_form(%{field: value})
      {:ok, %Form{}}

      iex> create_form(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form(attrs \\ %{}) do
    %Form{}
    |> Form.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form.

  ## Examples

      iex> update_form(form, %{field: new_value})
      {:ok, %Form{}}

      iex> update_form(form, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form(%Form{} = form, attrs) do
    form
    |> Form.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a form.

  ## Examples

      iex> delete_form(form)
      {:ok, %Form{}}

      iex> delete_form(form)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form(%Form{} = form) do
    Repo.delete(form)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form changes.

  ## Examples

      iex> change_form(form)
      %Ecto.Changeset{data: %Form{}}

  """
  def change_form(%Form{} = form, attrs \\ %{}) do
    Form.changeset(form, attrs)
  end

  alias QuizApp.Quiz.Item

  @doc """
  Returns the list of item.

  ## Examples

      iex> list_item()
      [%Item{}, ...]

  """
  def list_item do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias QuizApp.Quiz.FormAnswers

  @doc """
  Returns the list of form_answers.

  ## Examples

      iex> list_form_answers()
      [%FormAnswers{}, ...]

  """
  def list_form_answers do
    Repo.all(FormAnswers)
  end

  @doc """
  Gets a single form__answers.

  Raises `Ecto.NoResultsError` if the Form  answers does not exist.

  ## Examples

      iex> get_form__answers!(123)
      %FormAnswers{}

      iex> get_form__answers!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form__answers!(id), do: Repo.get!(FormAnswers, id)

  @doc """
  Creates a form__answers.

  ## Examples

      iex> create_form__answers(%{field: value})
      {:ok, %FormAnswers{}}

      iex> create_form__answers(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form__answers(attrs \\ %{}) do
    %FormAnswers{}
    |> FormAnswers.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form__answers.

  ## Examples

      iex> update_form__answers(form__answers, %{field: new_value})
      {:ok, %FormAnswers{}}

      iex> update_form__answers(form__answers, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form__answers(%FormAnswers{} = form__answers, attrs) do
    form__answers
    |> FormAnswers.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a form__answers.

  ## Examples

      iex> delete_form__answers(form__answers)
      {:ok, %FormAnswers{}}

      iex> delete_form__answers(form__answers)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form__answers(%FormAnswers{} = form__answers) do
    Repo.delete(form__answers)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_answers changes.

  ## Examples

      iex> change_form_answers(form_answers)
      %Ecto.Changeset{data: %FormAnswers{}}

  """
  def change_form_answers(%FormAnswers{} = form__answers, attrs \\ %{}) do
    FormAnswers.changeset(form__answers, attrs)
  end

  def get_questions(form_id) do
    Question
    |> where([q], q.form_id == ^form_id)
    |> preload([:item])
    |> Repo.all()
  end

  def get_answers(form_id) do
    FormAnswers
    |> where([q], q.form_id == ^form_id)
    |> Repo.all()
  end
end
