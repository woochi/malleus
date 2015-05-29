Card = require("./card.coffee")
Selector = require("./selector.coffee")
homeworlds = require("../data/homeworlds.coffee")

Homeworld = React.createClass

  render: ->
    <li>
      <div>@props.world.name</div>
      <div>@props.world.description</div>
    </li>

HomeworldSelector = React.createClass
  displayName: "HomeworldSelector"

  render: ->
    <Selector onSelect={@onSelect}>
      {homeworlds.map (world, i) ->
        <Card key={i} title={world.name} subtitle={world.description}/>
      }
    </Selector>

  onSelect: (worldNo) ->
    console.log "SELECT", worldNo

module.exports = HomeworldSelector
