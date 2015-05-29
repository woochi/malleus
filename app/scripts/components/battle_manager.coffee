UnitCard = require("components/unit_card")
UnitContainer = require("components/unit_container")
UnitManager = require("components/unit_manager")
UnitActions = require("actions/unit_actions")
BattleActions = require("actions/battle_actions")
battleStore = require("stores/battle_store")
UnitList = require("components/unit_list")
Unit = require("models/unit")
TransitionGroup = React.addons.CSSTransitionGroup
Immutable = require("immutable")
Drawer = require("components/drawer")
UnitViewer = require("components/unit_viewer")
BattleNotifier = require("components/battle_notifier")

BattleManager = React.createClass
  displayName: "BattleManager"

  getInitialState: ->
    data: battleStore.getState()

  componentDidMount: ->
    battleStore.listen(@update)

  componentWillUnmount: ->
    battleStore.unlisten(@update)

  render: ->
    state = @state.data
    hasStarted = !!state.get("turn")
    selectedUnit = state.get("selectedUnit")

    console.log "RENDER", selectedUnit
    phase =
      if hasStarted
        "Round #{state.round}"
      else
        "Setup phase"
    manager =
      <div>
        <UnitManager onDragStart={@onUnitDrag}/>
      </div>
    <Drawer.Layout menu={manager}>
      <div className="bm">
        <div className="bm-wrap">
          <header className="bm-header">
            <div className="bm-header-right">
              <Drawer.Toggle>
                <span className="uppercase">Units</span>
                <i className="fa fa-fw fa-lg fa-bars"></i>
              </Drawer.Toggle>
            </div>
            <div className="bm-header-left">
              {phase}
            </div>
            <div className="bm-header-title">
              {
                if hasStarted
                  <a onClick={@endTurn}>End turn</a>
                else
                  <a onClick={@startBattle}>Start battle</a>
              }
            </div>
          </header>
          <section className="bm-content">
            <div className="bm-panel">
              <UnitList
                units={state.get("allies")}
                inTurn={false}
                currentUnit={state.get("currentUnit")}
                onDragOver={@allowDrop}
                onDrop={@onAllyDrop}
                onDestroy={@onAllyDestroy}
                onSelect={@onSelectUnit}/>
            </div>
            <div className="bm-panel bm-panel-full">
              {if selectedUnit?
                <UnitViewer unit={selectedUnit}/>}
            </div>
            <div className="bm-panel">
              <UnitList
                units={state.get("enemies")}
                inTurn={false}
                currentUnit={state.get("currentUnit")}
                onDragOver={@allowDrop}
                onDrop={@onEnemyDrop}
                onDestroy={@onEnemyDestroy}
                onSelect={@onSelectUnit}/>
            </div>
          </section>
          <footer className="bm-footer">
            <BattleNotifier/>
          </footer>
        </div>
      </div>
    </Drawer.Layout>

  startBattle: ->
    BattleActions.startBattle()

  endTurn: ->
    BattleActions.advanceTurn()

  restartBattle: ->
    BattleActions.restart()

  onSelectUnit: (unit) ->
    BattleActions.selectUnit(unit)

  allowDrop: (e) ->
    e.preventDefault()

  onAllyDrop: ->
    UnitActions.createAlly(@state.data.get("draggedUnit"))

  onEnemyDrop: ->
    UnitActions.createEnemy(@state.data.get("draggedUnit"))

  onToggleUnitState: (unit) ->
    BattleActions.toggleUnitState(unit)

  onUnitDamage: (unit, roll, penetration, target) ->
    armour = unit.armour[target]
    damage = Droll.roll(roll).total or parseInt(roll)
    BattleActions.updateUnit(unit, woundsCurrent: unit.woundsCurrent - damage)

  update: ->
    @setState data: battleStore.getState()

  onAllyDestroy: (ally) ->
    UnitActions.destroyAlly(ally)

  onEnemyDestroy: (enemy) ->
    UnitActions.destroyEnemy(enemy)

module.exports = BattleManager
