classnames = require("classnames")

ButtonGroup = React.createClass

  getInitialState: ->
    selected: 0

  render: ->
    <ul className="btn-group">
      {React.Children.map @props.children, @renderButton}
    </ul>

  renderButton: (child, i) ->
    className = classnames
      "btn-group-current": @state.selected is i
    <li className={className} onClick={@select.bind(@, i)}>{child}</li>

  select: (i) ->
    @setState selected: i

module.exports = ButtonGroup
