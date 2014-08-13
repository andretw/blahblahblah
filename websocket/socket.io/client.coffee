socket = io.connect("http://localhost:1025")
socket.on "news", (data) ->
    console.log "this is test:"
    console.log data
    socket.emit "my other event",
        my: "data"

    return