Tooltip = require("components/tooltip")
classnames = require("classnames")
Immutable = require("immutable")
Counter = require("components/counter")
Dropdown = require("components/dropdown")
WoundCounter = require("components/counter")

UNIT_STATES = ["safe", "wounded", "danger", "dead"]

Unit = React.createClass

  getInitialState: ->
    status: 0
    woundsCurrent: @props.unit.get("woundsCurrent")
    woundsMax: @props.unit.get("woundsMax")

  getDefaultProps: ->
    selected: false
    unit: new Immutable.Record()

  render: ->
    className = classnames
      "unit": true
      "selected": @props.selected
      "current": @props.current
      "unit-#{UNIT_STATES[@state.status]}": true

    <div className={className} onClick={@onClick}>
      <WoundCounter
        className="unit-wound-counter"
        value={@state.woundsCurrent}
        max={@state.woundsMax}
        onDecrease={@decreaseWounds}
        onIncrease={@increaseWounds}/>
      <div className="unit-state" onClick={@toggleState}></div>
      <span className="unit-name">{@props.unit.get("name")}</span>
    </div>

  toggleState: ->
    status = @state.status + 1
    status = 0 if status == UNIT_STATES.length
    @setState status: status

  onClick: (e) ->
    e.stopPropagation()
    @props.onSelect?(@props.unit)

  onDestroy: ->
    @props.onDestroy?(@props.unit)

  decreaseWounds: ->
    console.log "DECREASE"
    @setState woundsCurrent: @state.woundsCurrent - 1

  increaseWounds: ->
    @setState woundsCurrent: @state.woundsCurrent + 1

module.exports = Unit
