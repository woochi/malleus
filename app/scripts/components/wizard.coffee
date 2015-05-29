Input = require("lib/input")

Wizard = React.createClass

  getInitialState: ->
    currentPage: 0

  render: ->
    currentStep = @props.children[@state.currentPage]
    <div className="wizard">
      {@renderHeader(currentStep)}
      {currentStep}
      {@renderFooter()}
    </div>

  renderHeader: (currentStep) ->
    <header className="wizard-header">
      <div className="wizard-step-title">{currentStep.props.title}</div>
    </header>

  renderFooter: ->
    <footer className="wizard-footer">
      <div className="wizard-nav">
        <ul>
          <li><a onClick={@back}>Back</a></li>
          <li><a>{@state.currentPage + 1}/{@props.children.length}</a></li>
          <li><a onClick={@next}>Next</a></li>
        </ul>
      </div>
    </footer>

  next: ->
    @setState
      currentPage: Math.min(@state.currentPage + 1, @props.children.length - 1)

  back: ->
    @setState
      currentPage: Math.max(0, @state.currentPage - 1)

module.exports = Wizard
