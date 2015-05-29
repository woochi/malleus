Input = require("lib/input")
TransitionGroup = React.addons.CSSTransitionGroup
classnames = require("classnames")

Selector = React.createClass

  getInitialState: ->
    current: 0

  componentDidMount: ->
    @subscriptions = []
    @subscriptions.push(Input.onKey("up")
      .subscribe(@prev.bind(@)))
    @subscriptions.push(Input.onKey("down")
      .subscribe(@next.bind(@)))

  componentWillUnmount: ->
    for f in @subscriptions
      f.dispose()
      return

  render: ->
    transitionOptions =
      className: "selector-fader"
      transitionName: "fade"
    React.createElement "div", className: "selector",
      @renderBullets()
      React.createElement TransitionGroup, transitionOptions,
        React.createElement "div",
          key: @state.current
          className: "selector-content"
        , @props.children[@state.current]

  renderBullets: ->
    React.createElement "ul", className: "selector-bullets",
      for i in [0..@props.children.length - 1]
        className = classnames
          "selector-bullet": true
          "current": i is @state.current
        React.createElement "li", className: className,
          React.createElement "a", onClick: @goToPage.bind(@, i)

  goToPage: (i) ->
    @setState current: i

  next: ->
    @setState current: Math.min(@state.current + 1, @props.children.length - 1)

  prev: ->
    @setState current: Math.max(@state.current - 1, 0)

  select: ->
    @props.onSelect(@state.current)

module.exports = Selector
