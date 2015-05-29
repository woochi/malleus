Skill = React.createFactory require("./skill.coffee")

SkillGroup = React.createClass

  getInitialState: ->
    expanded: false

  render: ->
    className = React.addons.classSet
      "skill-group": true
      "skill-group-expanded": @state.expanded

    React.createElement "li", null,
      React.createElement "div", onClick: @toggle, @props.name
      React.createElement "ul", className: className,
        if @state.expanded
          @props.children

  toggle: ->
    console.log "TOGGLE"
    @setState expanded: !@state.expanded

module.exports = SkillGroup
