defmodule TwitterPlayground.TweetsChannel do
  use Phoenix.Channel
  alias TwitterPlayground.TweetStreamer

  def join("tweets", %{"track" => query}, socket) do
    send(self, {:after_join, query})
    {:ok, socket}
  end

  def handle_info({:after_join, query}, socket) do
    spawn(fn -> TweetStreamer.start(socket, query) end)
    {:noreply, socket}
  end

end
