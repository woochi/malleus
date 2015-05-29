alt = require("lib/alt")
LinkedList = require("circular-list")
UnitActions = require("actions/unit_actions")
BattleActions = require("actions/battle_actions")
Droll = require("droll")
StatsHelper = require("helpers/stats")
_ = require("lodash")
Immutable = require("immutable")
immutable = require("alt/utils/ImmutableUtil")
Unit = require("models/unit")
Helpers = require("helpers/stats")

# UNIT_STATES = ["killed", "stunned", "alive"]

class BattleStore

  state: Immutable.Map
    turn: 0
    allies: Immutable.OrderedMap()
    enemies: Immutable.OrderedMap()
    unitQueue: Immutable.List()
    currentUnit: null
    selectedUnit: null
    draggedUnit: null

  constructor: ->
    @bindListeners
      onStart: BattleActions.startBattle
      onAdvanceTurn: BattleActions.advanceTurn
      onCreateAlly: UnitActions.createAlly
      onDestroyAlly: UnitActions.destroyAlly
      onUpdateAlly: UnitActions.updateAlly
      onCreateEnemy: UnitActions.createEnemy
      onDestroyEnemy: UnitActions.destroyEnemy
      onUpdateEnemy: UnitActions.updateEnemy
      onSelectUnit: BattleActions.selectUnit
      onUnitDragStart: BattleActions.unitDragStart
      onUnitDragEnd: BattleActions.unitDragEnd

  # Action hooks

  onStart: ->
    initiatives = {}
    allies = @state.get("allies")
    enemies = @state.get("enemies")
    units = allies.merge(enemies)
      .toList()
      .sortBy(((unit) -> unit.get("initiative")), (a, b) -> a < b)

    @setState @state.set("unitQueue", units)
    @_advanceTurn()

  onAdvanceTurn: ->
    @_advanceTurn()

  onCreateAlly: (template) ->
    unit = @_unitFromTemplate(template)
    nextAllies = @state.get("allies").set(_.uniqueId(), unit)
    @setState @state.set("allies", nextAllies)
    @_addToQueue(unit)

  onDestroyAlly: (props) ->

  onUpdateAlly: (props) ->

  onCreateEnemy: (template) ->
    unit = @_unitFromTemplate(template)
    nextEnemies = @state.get("enemies").set(_.uniqueId(), unit)
    @setState @state.set("enemies", nextEnemies)
    @_addToQueue(unit)

  onDestroyEnemy: (enemy) ->

  onUpdateEnemy: (enemy) ->

  onSelectUnit: (unit) ->
    @setState @state.set("selectedUnit", unit)

  onWoundUnit: (unit) ->

  onHealUnit: (unit) ->

  onUnitDragStart: (unit) ->
    @setState @state.set("draggedUnit", unit)

  onUnitDragEnd: (unit) ->
    @setState @state.set("draggedUnit", null)

  # Private

  _unitFromTemplate: (template) ->
    initiative = Helpers.initiative(template.get("stats").get("ag"))
    Unit(template.toMap()).set("initiative", initiative)

  _advanceTurn: ->
    unitQueue = @state.get("unitQueue")
    nextUnit = unitQueue.first()
    @setState(@state.merge
      turn: @state.get("turn") + 1
      currentUnit: nextUnit
      selectedUnit: nextUnit
      round: @_currentRound()
      unitQueue: @state.get("unitQueue").shift().push(nextUnit))

  _currentRound: ->
    unitCount = @state.get("allies").size + @state.get("enemies").size
    Math.ceil(@state.get("turn") / unitCount)

  _afterDestroy: (unit) ->
    if unit is @currentUnit
      @_advanceTurn()

  _addToQueue: (unit) ->
    @setState @state.set("unitQueue", @state.get("unitQueue").push(unit))

module.exports = alt.createStore(immutable(BattleStore))
