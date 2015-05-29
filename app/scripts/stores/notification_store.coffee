alt = require("lib/alt")
BattleActions = require("actions/battle_actions")
window.Helpers = require("helpers/stats")

class NotificationStore

  constructor: ->
    @message = "Battle has not yet started"

    @bindListeners
      onUseWeapon: BattleActions.useWeapon
      onRollStat: BattleActions.rollStat

  onUseWeapon: ({unit, weapon, rof, range}) ->
    modifier = Helpers.rangeModifier(range) + Helpers.rofModifier(rof)
    attack = Helpers.attack(unit, weapon, rof, modifier)
    if attack.degrees < 0
      message = "#{unit.get("name")} misses with his #{weapon.get("name")} by #{attack.degrees} degrees. (#{attack.roll})"
    else
      message = "#{unit.get("name")} hits with #{weapon.get("name")} by #{attack.degrees} degrees hitting #{Helpers.humanize(attack.location.name)} for #{attack.damages} damage (PEN #{weapon.get("penetration") or 0})."
    @setState
      message: message

  onRollStat: ({unit, stat}) ->
    result = Helpers.test(unit.get("stats").get(stat))
    statName = Helpers.humanize(stat)
    if result.degrees < 0
      message = "#{unit.get("name")} fails in a #{statName} test by #{result.degrees} degrees. (#{result.roll})"
    else
      message = "#{unit.get("name")} succeeds in a #{statName} test by #{result.degrees} degrees. (#{result.roll})"
    @setState
      message: message

module.exports = alt.createStore(NotificationStore)
