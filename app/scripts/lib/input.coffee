Rx = require('rx')

codeNames =
  27: "esc"
  38: "up"
  40: "down"
  37: "left"
  39: "right"

codeToKeyName = (e) ->
  name = codeNames[e.which]
  if name then name else null

isKey = (key) ->
  (k) -> k is key

keydowns = Rx.Observable.fromEvent(document, "keydown")
keyups = Rx.Observable.fromEvent(document, "keyup")
keyboard = keyups.map(codeToKeyName)

mouse = Rx.Observable.fromEvent(document, "mousemove")
  .map((e) -> x: e.pageX, y: e.pageY)

module.exports =
  onKey: (key) -> keyboard.filter(isKey(key))
  onMouseMove: mouse
