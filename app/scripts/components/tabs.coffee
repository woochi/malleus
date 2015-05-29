Tabs = React.createClass

  getInitialState: ->
    current: 0

  render: ->
    currentTab = @props.children[@state.current]
    React.createElement "div", null,
      React.createElement "ul", className: "tab-list",
        @props.children.map (tab, i) =>
          React.createElement "li", null,
            React.createElement "a", onClick: @select.bind(@, i), className: "tab-link", tab.props.name
      currentTab

  select: (i) ->
    if @state.current != i
      @setState current: i

module.exports = Tabs
