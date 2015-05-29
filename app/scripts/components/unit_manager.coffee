templateStore = require("stores/template_store")
BattleActions = require("actions/battle_actions")

UnitManager = React.createClass

  getInitialState: ->
    templateStore.getState()

  render: ->
    <div className="um">
      {@state.sortBy((template) -> template.get("name")).map(@renderItem)}
    </div>

  renderItem: (template, id) ->
    <div
      className="um-unit"
      draggable="true"
      onDragStart={@onDragStart.bind(@, template)}>
      {template.get("name")}
    </div>

  onDragStart: (template, e) ->
    e.dataTransfer.effectAllowed = "move"
    BattleActions.unitDragStart(template)

module.exports = UnitManager
