React = require("react")
BattleActions = require("actions/battle_actions")
Input = require("lib/input")
Immutable = require("immutable")
ButtonGroup = require("components/button_group")
Rof = require("constants/rof")
Range = require("constants/range")
PowerTable = require("components/power_table")
TalentTable = require("components/talent_table")
TraitTable = require("components/trait_table")
WeaponTable = require("components/weapon_table")
WoundCounter = require("components/counter")

UnitViewer = React.createClass

  getInitialState: ->
    range: Range.NORMAL
    rof: Rof.SINGLE

  render: ->
    stats = @props.unit.get("stats")
    <div className="uv">
      <header className="uv-header">
        <h2 className="uv-title">{@props.unit.get("name")}</h2>
      </header>
      <TraitTable traits={@props.unit.get("traits")}/>
      <table className="uv-stats">
        <tbody>
          <tr>
            {stats.take(3).map(@renderStat)}
          </tr>
          <tr>
            {stats.skip(3).take(3).map(@renderStat)}
          </tr>
          <tr>
            {stats.skip(6).take(3).map(@renderStat)}
          </tr>
          <tr>
            {stats.skip(9).map(@renderStat)}
          </tr>
        </tbody>
      </table>
      <ButtonGroup ref="range">
        <button className="btn btn-default">Normal</button>
        <button className="btn btn-default">Short</button>
        <button className="btn btn-default">Point-blank</button>
      </ButtonGroup>
      <WeaponTable
        weapons={@props.unit.get("weapons")}
        useWeapon={@useWeapon}/>
      <TalentTable talents={@props.unit.get("talents")}/>
      <PowerTable powers={@props.unit.get("powers")}/>
    </div>

  renderStat: (val, stat) ->
    <td className="uv-stat" onClick={@rollStat.bind(@, val, stat)}>
      <span className="uv-stat-name">{stat}</span>
      <span className="uv-stat-val">{val}</span>
    </td>

  useWeapon: (weapon, rof) ->
    unit = @props.unit
    range = @refs.range.state.selected
    BattleActions.useWeapon({unit, weapon, rof, range})

  rollStat: (val, stat) ->
    unit = @props.unit
    BattleActions.rollStat({unit, stat})

  woundUnit: ->
    unit = @props.unit
    BattleActions.woundUnit({unit})

  healUnit: ->
    unit = @props.unit
    BattleActions.healUnit({unit})

module.exports = UnitViewer
