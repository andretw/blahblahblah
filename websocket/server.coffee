conns = new Array()
ws = require("websocket-server")
server = ws.createServer()
server.addListener "connection", (conn) ->
    console.log "connection..."
    conns.push conn
    conn.addListener "message", (msg) ->
        console.log msg
        i = 0

        while i < conns.length
            conns[i].send msg  unless conns[i] is conn
            i++
        return

    return

server.listen 1025
console.log "running......"