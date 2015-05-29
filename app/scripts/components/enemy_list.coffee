UnitList = require("components/unit_list")
enemyStore = require("stores/enemy_store")

EnemyList = React.createClass

  componentDidMount: ->
    enemyStore.listen(@onChange)

  componentWillUnmount: ->
    enemyStore.unlisten(@onChange)

  render: ->
    <UnitList units={enemyStore.getState().units} {...@props}/>

  onChange: ->
    @forceUpdate()

module.exports = EnemyList
