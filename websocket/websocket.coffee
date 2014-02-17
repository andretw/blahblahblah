# Origin from http://www.websocket.org/echo.html

wsUri = "ws://echo.websocket.org/"
output = undefined
websocket = new WebSocket(wsUri)

init = ->
    output = document.getElementById("output")
    testWebSocket()
    return
testWebSocket = ->
    websocket.onopen = (evt) ->
        onOpen evt
        return

    websocket.onclose = (evt) ->
        onClose evt
        return

    websocket.onmessage = (evt) ->
        onMessage evt
        return

    websocket.onerror = (evt) ->
        onError evt
        return

    return

onOpen = (evt) ->
    writeToScreen "CONNECTED"
    doSend "WebSocket rocks 中文"
    return
onClose = (evt) ->
    writeToScreen "DISCONNECTED"
    return
onMessage = (evt) ->
    writeToScreen "<span style=\"color: blue;\">RESPONSE: " + evt.data + "</span>"
    websocket.close()
    return
onError = (evt) ->
    writeToScreen "<span style=\"color: red;\">ERROR:</span> " + evt.data
    return
doSend = (message) ->
    writeToScreen "SENT: " + message
    websocket.send message
    return
writeToScreen = (message) ->
    pre = document.createElement("p")
    pre.style.wordWrap = "break-word"
    pre.innerHTML = message
    output.appendChild pre
    return

window.addEventListener "load", init, false