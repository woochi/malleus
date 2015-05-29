CardInfo = React.createClass

  render: ->
    React.createElement "div", className: "card-info",
      React.createElement "h2", className: "card-info-title",
        @props.title
      React.createElement "p", className: "card-info-subtitle",
        @props.subtitle

module.exports = CardInfo
