i = 0

app = require("http").createServer(handler)
io = require("socket.io").listen(app)
fs = require("fs")
app.listen 1025

handler = (req, res) ->
    fs.readFile __dirname + "/index.html", (err, data) ->
        if err
            res.writeHead 500
            return res.end("Error loading index.html")
        res.writeHead 200
        res.end data
        return

    return

io.sockets.on "connection", (socket) ->
    myloop = ()->
        console.log "connection established"
        socket.emit "news",
            hello: "world:andre" + i
        
        i = i + 1
        setTimeout(
            ()->
                myloop()
            1000
        )

    myloop()

    socket.on "my other event", (data) ->
        console.log data
        return

    return
