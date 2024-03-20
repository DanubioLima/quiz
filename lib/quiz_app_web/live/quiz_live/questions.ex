defmodule QuizAppWeb.QuizLive.Questions do
  use QuizAppWeb, :live_view

  alias QuizApp.Quiz

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-1 gap-10">
      <.form for={@form} phx-submit="save" phx-validate="validate">
        <.inputs_for :let={f} field={@form[:questions]}>
          <div class="bg-blue-200 rounded-2xl shadow-md p-4 mb-6">
            <h1 class="text-lg font-bold mb-2"><%= f[:title].value %></h1>
            <.inputs_for :let={fi} field={f[:items]}>
              <div class="p-2">
                <input type="radio" id={fi.id} name={f[:item].name} value={fi.data.id} required />

                <label for={fi.id}><%= fi[:title].value %></label>
              </div>
            </.inputs_for>
          </div>
        </.inputs_for>

        <.button type="submit">Enviar</.button>
      </.form>
    </div>

    <%= if @show_modal do %>
      <.modal id="finish_form_modal" show={true}>
        <h1 class="text-2xl font-bold">Parabéns!</h1>
        <div class="py-2">
          <p class="text-lg">
            Você finalizou o questionário com sucesso. Agora é hora de verificar seus acertos.
          </p>
        </div>
        <div class="border-t border-gray-300 my-6"></div>
        <.button phx-click="view_answers" phx-value-form_id={@form.data.id}>
          Verificar acertos
        </.button>
      </.modal>
    <% end %>
    """
  end

  def mount(%{"form_id" => form_id} = _params, _session, socket) do
    form =
      Quiz.get_form!(form_id)
      |> Ecto.Changeset.change()
      |> to_form()

    {:ok, assign(socket, form: form, show_modal: false)}
  end

  def handle_event("view_answers", %{"form_id" => form_id} = _params, socket) do
    {:noreply, push_navigate(socket, to: ~p"/quiz/answers/#{form_id}")}
  end

  def handle_event("save", params, socket) do
    form_id = socket.assigns.form.data.id

    questions = params["form"]["questions"]

    answers =
      questions
      |> Enum.map(fn {_key, value} ->
        %{
          "question_id" => value["id"],
          "user_item_id" => value["item"]
        }
      end)

    {:ok, _} = Quiz.save_user_answers(answers, form_id)

    {:noreply, assign(socket, show_modal: true)}
  end
end
