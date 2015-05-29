Input = require("lib/input")

Tooltip = React.createClass

  componentDidMount: ->
    @subscriptions = []
    node = React.findDOMNode(@refs.tooltip)
    @subscriptions.push Input.onMouseMove.subscribe (pos) =>
      node.style.left = pos.x + "px"
      node.style.top = pos.y + "px"

  componentWillUnmount: ->
    s.dispose() for s in @subscriptions

  render: ->
    <div className="tooltip" ref="tooltip">
      {@props.children}
    </div>

module.exports = Tooltip
