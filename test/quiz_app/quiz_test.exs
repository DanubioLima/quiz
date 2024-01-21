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

  describe "form" do
    alias QuizApp.Quiz.Form

    import QuizApp.QuizFixtures

    @invalid_attrs %{name: nil}

    test "list_form/0 returns all form" do
      form = form_fixture()
      assert Quiz.list_form() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Quiz.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Form{} = form} = Quiz.create_form(valid_attrs)
      assert form.name == "some name"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quiz.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Form{} = form} = Quiz.update_form(form, update_attrs)
      assert form.name == "some updated name"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Quiz.update_form(form, @invalid_attrs)
      assert form == Quiz.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Quiz.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Quiz.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Quiz.change_form(form)
    end
  end

  describe "item" do
    alias QuizApp.Quiz.Item

    import QuizApp.QuizFixtures

    @invalid_attrs %{type: nil, title: nil}

    test "list_item/0 returns all item" do
      item = item_fixture()
      assert Quiz.list_item() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Quiz.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{type: "some type", title: "some title"}

      assert {:ok, %Item{} = item} = Quiz.create_item(valid_attrs)
      assert item.type == "some type"
      assert item.title == "some title"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quiz.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{type: "some updated type", title: "some updated title"}

      assert {:ok, %Item{} = item} = Quiz.update_item(item, update_attrs)
      assert item.type == "some updated type"
      assert item.title == "some updated title"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Quiz.update_item(item, @invalid_attrs)
      assert item == Quiz.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Quiz.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Quiz.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Quiz.change_item(item)
    end
  end

  describe "form_answers" do
    alias QuizApp.Quiz.Form_Answers

    import QuizApp.QuizFixtures

    @invalid_attrs %{form_id: nil, question_id: nil, correct_item_id: nil}

    test "list_form_answers/0 returns all form_answers" do
      form__answers = form__answers_fixture()
      assert Quiz.list_form_answers() == [form__answers]
    end

    test "get_form__answers!/1 returns the form__answers with given id" do
      form__answers = form__answers_fixture()
      assert Quiz.get_form__answers!(form__answers.id) == form__answers
    end

    test "create_form__answers/1 with valid data creates a form__answers" do
      valid_attrs = %{form_id: "7488a646-e31f-11e4-aace-600308960662", question_id: "7488a646-e31f-11e4-aace-600308960662", correct_item_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Form_Answers{} = form__answers} = Quiz.create_form__answers(valid_attrs)
      assert form__answers.form_id == "7488a646-e31f-11e4-aace-600308960662"
      assert form__answers.question_id == "7488a646-e31f-11e4-aace-600308960662"
      assert form__answers.correct_item_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_form__answers/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quiz.create_form__answers(@invalid_attrs)
    end

    test "update_form__answers/2 with valid data updates the form__answers" do
      form__answers = form__answers_fixture()
      update_attrs = %{form_id: "7488a646-e31f-11e4-aace-600308960668", question_id: "7488a646-e31f-11e4-aace-600308960668", correct_item_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Form_Answers{} = form__answers} = Quiz.update_form__answers(form__answers, update_attrs)
      assert form__answers.form_id == "7488a646-e31f-11e4-aace-600308960668"
      assert form__answers.question_id == "7488a646-e31f-11e4-aace-600308960668"
      assert form__answers.correct_item_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_form__answers/2 with invalid data returns error changeset" do
      form__answers = form__answers_fixture()
      assert {:error, %Ecto.Changeset{}} = Quiz.update_form__answers(form__answers, @invalid_attrs)
      assert form__answers == Quiz.get_form__answers!(form__answers.id)
    end

    test "delete_form__answers/1 deletes the form__answers" do
      form__answers = form__answers_fixture()
      assert {:ok, %Form_Answers{}} = Quiz.delete_form__answers(form__answers)
      assert_raise Ecto.NoResultsError, fn -> Quiz.get_form__answers!(form__answers.id) end
    end

    test "change_form__answers/1 returns a form__answers changeset" do
      form__answers = form__answers_fixture()
      assert %Ecto.Changeset{} = Quiz.change_form__answers(form__answers)
    end
  end
end
