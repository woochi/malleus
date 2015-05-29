Unit = require("components/unit")
Immutable = require("immutable")

UnitList = React.createClass

  getDefaultProps: ->
    className: "unit-list"
    units: Immutable.OrderedMap()
    inTurn: false

  render: ->
    <ul className={@props.className} {...@props}>
      {@props.units.map (unit, key, i) =>
        <Unit
          key={key}
          unit={unit}
          current={@props.currentUnit is unit}
          onDestroy={@props.onDestroy}
          onSelect={@props.onSelect}
        />
      }
    </ul>

module.exports = UnitList
