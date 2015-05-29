CharacterListItem = React.createClass

  render: ->
    React.createElement "li", null,
      React.createElement "div", null, @props.character.id || @props.character.cid

module.exports = CharacterListItem
