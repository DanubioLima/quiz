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

alias QuizApp.Quiz.{Form, Question, Item, FormAnswers}

form = Form.insert!(%{name: "Protocolo HTTP"})

# first question
question_1 = Question.insert!(%{title: "O que é HTTP?", form_id: form.id})

Item.insert!(%{title: "Biblioteca da linguagem Python", question_id: question_1.id})

item_2 =
  Item.insert!(%{
    title: "Protocolo da camada de aplicação para transferência de hipermídia",
    question_id: question_1.id
  })

Item.insert!(%{
  title: "Uma banda de rock da década de 70",
  question_id: question_1.id
})

FormAnswers.insert!(%{form_id: form.id, question_id: question_1.id, correct_item_id: item_2.id})

# second question
question_2 =
  Question.insert!(%{
    title: "Qual método HTTP é mais utilizado no envio de formulários?",
    form_id: form.id
  })

Item.insert!(%{title: "SEND", question_id: question_2.id})

item_2 = Item.insert!(%{title: "POST", question_id: question_2.id})

Item.insert!(%{title: "GET", question_id: question_2.id})

FormAnswers.insert!(%{
  form_id: form.id,
  question_id: question_2.id,
  correct_item_id: item_2.id
})
