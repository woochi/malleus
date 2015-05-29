Card = require("./card.coffee")
Selector = require("./selector.coffee")
roles = require("../data/roles.coffee")

RoleSelector = React.createClass
  displayName: "RoleSelector"

  render: ->
    <Selector onSelect={@onSelect}>
      {roles.map (role, i) ->
        <Card
          key={i}
          title={role.name}
          subtitle={role.description}/>
      }
    </Selector>

module.exports = RoleSelector
