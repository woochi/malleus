WizardStep = React.createClass

  render: ->
    React.createElement "div", className: "wizard-step",
      @props.children

module.exports = WizardStep
