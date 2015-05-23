defmodule TwitterPlayground.TweetsChannel do
  use Phoenix.Channel
  alias TwitterPlayground.TweetStreamer

  def join("tweets", %{"track" => query}, socket) do
    spawn(fn -> TweetStreamer.start(socket, query) end)
    {:ok, socket}
  end

end
