classnames = require("classnames")

WoundCounter = React.createClass

  getDefaultProps: ->
    value: 0
    min: -10
    max: 0

  render: ->
    className = classnames("wound-counter", @props.className)
    <div className={className}>
      <a className="wounds-counter-down" onClick={@onDecrease}>
        <i className="fa fa-fw fa-minus-circle"></i>
      </a>
      <span className="wound-counter-current">{@props.value}</span>
      <span className="wound-counter-max">{@props.max}</span>
      <a className="wound-counter-up" onClick={@onIncrease}>
        <i className="fa fa-fw fa-plus-circle"></i>
      </a>
    </div>

  onDecrease: ->
    if @props.min < @props.value
      @props.onDecrease()

  onIncrease: ->
    if @props.max > @props.value
      @props.onIncrease()

module.exports = WoundCounter
