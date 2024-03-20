defmodule QuizAppWeb.QuizLive.Answers do
  use QuizAppWeb, :live_view

  alias QuizApp.Quiz

  def render(assigns) do
    ~H"""
    <div class="w-full py-6">
      <div class="container px-4 md:px-6">
        <div class="grid items-start gap-4 md:gap-8">
          <div class="space-y-2">
            <h1 class="text-3xl font-bold tracking-tighter sm:text-5xl">
              Resultado
            </h1>
            <p class="max-w-[700px] text-gray-500 md:text-xl/relaxed lg:text-base/relaxed xl:text-xl/relaxed">
              Revise suas respostas.
            </p>
          </div>
          <div class="space-y-4">
            <div :for={answer <- @user_answers} class="mb-8">
              <div class="space-y-2 space-x-2">
                <p class="text-base font-medium tracking-wider">
                  <%= answer.question.title %>
                </p>
              </div>
              <div class="space-y-4">
                <div class="flex space-x-4">
                  <div class="w-full space-y-2 bg-white rounded-lg shadow-md p-4 border border-gray-300">
                    <h3 class="text-lg font-medium tracking-wider uppercase text-gray-500">
                      Sua resposta
                    </h3>
                    <p class="text-base font-medium tracking-wider text-green-500">
                      <%= answer.user_item.title %>
                    </p>
                  </div>
                  <div class="w-full space-y-2 bg-white rounded-lg shadow-md p-4 border border-gray-300">
                    <h3 class="text-lg font-medium tracking-wider uppercase text-gray-500">
                      Resposta correta
                    </h3>
                    <p class="text-base font-medium tracking-wider">
                      <%= answer.correct_item.title %>
                    </p>
                  </div>
                </div>
                <div class={[
                  "space-y-2 rounded-lg shadow-md p-4",
                  answer.user_item.id == answer.correct_item.id && "bg-green-400",
                  answer.user_item.id != answer.correct_item.id && "bg-red-400"
                ]}>
                  <h3 class="text-lg font-medium tracking-wider uppercase text-gray-500">
                    Resultado
                  </h3>
                  <.icon
                    :if={answer.user_item.id == answer.correct_item.id}
                    name="hero-check-circle"
                    class="text-xs text-green-500"
                  />
                  <.icon
                    :if={answer.user_item.id != answer.correct_item.id}
                    name="hero-x-circle"
                    class="text-xs text-red-500"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def mount(%{"form_id" => form_id} = _params, _session, socket) do
    user_answers = Quiz.list_user_answers_by_form(form_id)

    {:ok, assign(socket, user_answers: user_answers)}
  end
end
