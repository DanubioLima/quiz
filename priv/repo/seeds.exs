# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuizApp.Repo.insert!(%QuizApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias QuizApp.Repo
alias QuizApp.Quiz
alias QuizApp.Quiz.{Form, Question, Item, FormAnswers}

form = Quiz.change_form(%Form{}, %{name: "Protocolo HTTP"}) |> Repo.insert!()

# first question
question_1 = Quiz.change_question(%Question{}, %{title: "O que é HTTP?"}) |> Repo.insert!()
Quiz.change_item(%Item{}, %{title: "Biblioteca da linguagem Python"}) |> Repo.insert!()

item_2 =
  Quiz.change_item(%Item{}, %{
    title: "Protocolo da camada de aplicação para transferência de hipermídia"
  })
  |> Repo.insert!()

Quiz.change_item(%Item{}, %{title: "Uma banda de rock da década de 70"}) |> Repo.insert!()

Quiz.change_form_answers(%FormAnswers{}, %{
  form_id: form.id,
  question_id: question_1.id,
  correct_item_id: item_2.id
})
|> Repo.insert!()

# second question
question_2 =
  Quiz.change_question(%Question{}, %{
    title: "Qual método HTTP é mais utilizado no envio de formulários?"
  })
  |> Repo.insert!()

Quiz.change_item(%Item{}, %{title: "SEND"}) |> Repo.insert!()

item_2 = Quiz.change_item(%Item{}, %{title: "POST"}) |> Repo.insert!()

Quiz.change_item(%Item{}, %{title: "GET"}) |> Repo.insert!()

Quiz.change_form_answers(%FormAnswers{}, %{
  form_id: form.id,
  question_id: question_2.id,
  correct_item_id: item_2.id
})
|> Repo.insert!()
