defmodule QuizApp.QuizTest do
  use QuizApp.DataCase, async: true

  alias QuizApp.Quiz
  alias QuizApp.Quiz.{Form, Question, Item}

  import QuizApp.Factory

  describe "get_form!/1" do
    test "raises when not found form" do
      assert_raise Ecto.NoResultsError, fn ->
        Quiz.get_form!("e23b7185-f583-4b0c-906a-ab64a3e9719f")
      end
    end

    test "returns the form" do
      %{id: id} = insert(:form, name: "Neural Networks")

      assert %Form{name: "Neural Networks"} = Quiz.get_form!(id)
    end

    test "returns the form with questions and items preloaded" do
      # GIVEN
      form = insert(:form, name: "Neural Networks")
      question = insert(:question, form: form)
      item = insert(:item, question: question)

      form_id = form.id
      question_id = question.id
      item_id = item.id

      # WHEN
      result = Quiz.get_form!(form_id)

      # THEN
      assert %Form{
               id: ^form_id,
               name: "Neural Networks",
               questions: [%Question{id: ^question_id, items: [%Item{id: ^item_id}]}]
             } = result
    end
  end

  describe "list_form/0" do
    test "returns empty lists when there is no form" do
      assert [] = Quiz.list_form()
    end

    test "returns the forms" do
      insert(:form, name: "Neural Networks")
      assert [%Form{}] = Quiz.list_form()
    end
  end
end
