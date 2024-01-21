defmodule QuizAppWeb.QuizLive.Index do
  use QuizAppWeb, :live_view

  alias QuizApp.Quiz

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-3 gap-4">
      <%= for form <- @forms do %>
        <.link class="bg-white shadow-md rounded-md p-4 cursor-pointer" patch={~p"/quiz/#{form.id}"}>
          <h2 class="text-xl font-bold"><%= form.name %></h2>
        </.link>
      <% end %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, forms: Quiz.list_form())}
  end

  def handle_event("to_form", %{"form_id" => form_id}, socket) do
    {:noreply, push_patch(socket, to: ~p"/quiz/#{form_id}")}
  end
end
