defmodule QuizAppWeb.QuizLive.Questions do
  use QuizAppWeb, :live_view

  alias QuizApp.Quiz

  def render(assigns) do
    ~H"""

    """
  end

  def mount(params, _session, socket) do
    params |> dbg()
    {:ok, socket}
  end
end
