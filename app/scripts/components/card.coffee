CardInfo = require("./card_info.coffee")

Card = React.createClass

  render: ->
    React.createElement "div", className: "card",
      React.createElement "div", className: "card-content",
        React.createElement CardInfo, @props

module.exports = Card
