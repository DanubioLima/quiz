defmodule QuizAppWeb.QuizLive.Questions do
  use QuizAppWeb, :live_view

  alias QuizApp.Quiz

  alias QuizApp.Quiz.{FormAnswers, Form}

  alias QuizApp.Repo

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-1 gap-10">
      <.form for={@form} phx-submit="save">
        <%= for question <- @form[:questions].value do %>
          <div class="bg-blue-200 rounded-2xl shadow-md p-4 mb-6">
            <h1 class="text-lg font-bold mb-2"><%= question.title %></h1>
            <div class="bg-gray-300 shadow-md p-4">
              <%= for item <- question.item do %>
                <div class="p-2">
                  <input type="radio" id={item.id} name={question.id} value={item.id} />
                  <label for={item.id}><%= item.title %></label>
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
        <.button type="submit">Enviar</.button>
        <pre><%= inspect(@form[:questions].value) %></pre>
      </.form>
    </div>
    """
  end

  def mount(%{"form_id" => form_id} = _params, _session, socket) do
    form =
      Repo.get(Form, form_id)
      |> Repo.preload(questions: :item)
      |> Ecto.Changeset.change()
      |> to_form()

    {:ok, assign(socket, form: form)}
  end

  def handle_event("save", params, socket) do
    params |> dbg()
    form_id = socket.assigns.form.data.id

    answers =
      Enum.map(params, fn {question_id, item_id} ->
        answer = Repo.get_by(FormAnswers, question_id: question_id, form_id: form_id)

        %{
          question_id: question_id,
          is_correct: answer.correct_item_id == item_id
        }
      end)
      |> dbg()

    {:noreply, assign(socket, answers: answers)}
  end
end
