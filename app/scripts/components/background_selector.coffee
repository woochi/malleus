Card = require("./card.coffee")
Selector = require("./selector.coffee")
backgrounds = require("../data/backgrounds.coffee")

BackgroundSelector = React.createClass
  displayName: "BackgroundSelector"

  render: ->
    <Selector onSelect={@onSelect}>
      {backgrounds.map (bg, i) ->
        <Card key={i} title={bg.name} subtitle={bg.description}/>
      }
    </Selector>

module.exports = BackgroundSelector
