Traits = require("data/traits")
Immutable = require("immutable")

TraitTable = React.createClass

  render: ->
    <ul className="inline-list">
      {@props.traits.map(@renderTrait)}
    </ul>

  renderTrait: (id) ->
    isLeveled = Immutable.List.isList(id)
    trait = if isLeveled then Traits[id.get(0)] else Traits[id]
    level = if isLeveled then id.get(1) else undefined
    <li title={trait.description}>
      {trait.name} {if level then "(#{level})"}
    </li>

module.exports = TraitTable
