React = require("react")
classnames = require("classnames")
EventEmitter = require("events").EventEmitter

toggles = new EventEmitter()
contentNode = null
drawerNode = null
maskNode = null
drawerOpen = false

DrawerToggle = React.createClass

  componentDidMount: ->
    toggles.addListener("toggle", @forceUpdate.bind(@))

  render: ->
    className = classnames
      "drawer-toggle": true
      "drawer-toggle-active": drawerOpen
    <a onClick={@emitToggle} className={className} {...@props}>
      {@props.children}
    </a>

  emitToggle: ->
    toggles?.emit("toggle")

DrawerLayout = React.createClass

  getDefaultProps: ->
    direction: "right"

  componentDidMount: ->
    contentNode = React.findDOMNode(@refs.content)
    drawerNode = React.findDOMNode(@refs.drawer)
    maskNode = React.findDOMNode(@refs.mask)
    toggles.addListener("toggle", @toggleDrawer)

  componentWillUnmount: ->
    toggles.removeListener("toggle", @toggleDrawer)
    toggles = null

  render: ->
    className = classnames
      "drawer-layout": true
      "drawer-layout-reveal-#{@props.direction}": drawerOpen
    maskClass = classnames
      "drawer-layout-mask": true
      "hidden": !drawerOpen

    <div className={className}>
      <div className="drawer-#{@props.direction}" ref="drawer">
        {@props.menu}
      </div>
      <div
        ref="content"
        className="drawer-layout-content"
      >
        {@props.children}
      </div>
    </div>

  toggleDrawer: ->
    drawerOpen = !drawerOpen
    @forceUpdate()

module.exports =
  Layout: DrawerLayout
  Toggle: DrawerToggle
