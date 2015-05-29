classnames = require("classnames")

Dropdown = React.createClass

  getInitialState: ->
    open: false

  getDefaultProps: ->
    align: "left"

  componentDidUpdate: ->
    if @state.open
      @bindClickListener()
    else
      @unbindClickListener()

  componentWillUnmount: ->
    @unbindClickListener()

  render: ->
    className = classnames
      "dropdown": true
      "dropdown-#{@props.align}": true
      "#{@props.className}": true
      "dropdown-open": @state.open

    <div className={className}>
      <a className="dropdown-toggle" onClick={@toggle}>
        <i className="fa fa-caret-down"></i>
      </a>
      <ul className="dropdown-actions">
        {React.Children.map @props.children, (child) ->
          <li>{child}</li>}
      </ul>
    </div>

  toggle: ->
    @setState open: !@state.open

  bindClickListener: ->
    document.addEventListener "click", @toggle

  unbindClickListener: ->
    document.removeEventListener "click", @toggle

module.exports = Dropdown
