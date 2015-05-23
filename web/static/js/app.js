import {Socket} from "phoenix"

let socket = new Socket("/ws")
socket.connect()
let chan = socket.chan("tweets", {track: "apple"})

chan.join().receive("ok", chan => {
    console.log("Success!")
})

let tweetsContainer = $('#tweets')
chan.on("tweet:stream", payload => {
  console.log(payload)
  tweetsContainer.prepend(`<li>${payload.tweet.text}</li>`)
})

let App = {
}

export default App
