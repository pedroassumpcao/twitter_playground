defmodule TwitterPlayground.TweetStreamer do

  def start(socket, query) do
    stream = ExTwitter.stream_filter(track: query)
    for tweet <- stream do
      Phoenix.Channel.push(socket, "tweet:stream", %{tweet: tweet})
    end
  end
end
