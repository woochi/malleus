Skill = React.createClass

  render: ->
    React.createElement "div", className: "skill",
      React.createElement "div", null, @props.name

module.exports = Skill
