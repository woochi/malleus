UnitList = require("components/unit_list")
allyStore = require("stores/ally_store")

AllyList = React.createClass

  componentDidMount: ->
    allyStore.listen(@onChange)

  componentWillUnmount: ->
    allyStore.unlisten(@onChange)

  render: ->
    <UnitList units={allyStore.getState().units} {...@props}/>

  onChange: ->
    @forceUpdate()

module.exports = AllyList
