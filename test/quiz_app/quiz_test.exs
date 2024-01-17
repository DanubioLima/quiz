defmodule QuizApp.QuizTest do
  use QuizApp.DataCase

  alias QuizApp.Quiz

  describe "question" do
    alias QuizApp.Quiz.Question

    import QuizApp.QuizFixtures

    @invalid_attrs %{type: nil, title: nil}

    test "list_question/0 returns all question" do
      question = question_fixture()
      assert Quiz.list_question() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Quiz.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{type: "some type", title: "some title"}

      assert {:ok, %Question{} = question} = Quiz.create_question(valid_attrs)
      assert question.type == "some type"
      assert question.title == "some title"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quiz.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{type: "some updated type", title: "some updated title"}

      assert {:ok, %Question{} = question} = Quiz.update_question(question, update_attrs)
      assert question.type == "some updated type"
      assert question.title == "some updated title"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Quiz.update_question(question, @invalid_attrs)
      assert question == Quiz.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Quiz.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Quiz.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Quiz.change_question(question)
    end
  end
end
