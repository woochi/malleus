CardList = React.createClass

  render: ->
    React.createElement "ul", className: "card-list",
      @props.children

module.exports = CardList
