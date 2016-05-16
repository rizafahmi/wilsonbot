defmodule Wilsonbot.Slack do
  use Slack
  require IEx

  @token Application.get_env(:wilsonbot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])


  def handle_message(message = %{type: "message", text: text}, slack, state) do

    IO.inspect text
    if text == "<@#{slack.me.id}>: hello" do
      Slack.send_message("Hello sire!", message.channel, slack)
    end

    {:ok, state}
  end

  def handle_message(message, slack, state) do
    IO.inspect message
      
    {:ok, state}
  end

  def handle_message(_message, _slack, state), do: {:ok, state}
end
