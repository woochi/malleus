UnitCard = React.createClass

  getInitialState: ->
    damageInput: false

  render: ->
    <div className="card">
      {@renderDamageOverlay() if @state.damageInput}
      <div className="card-name">
        {@props.name}
        <a onClick={@toggleDamageInput}>Deal damage</a>
      </div>
      <div className="card-armours">
        {for target, val of @props.armour
            <div className="card-soak">
              <div className="card-armour-value">{val}</div>
              {val + Math.floor(@props.stats.t / 10)}
            </div>
        }
      </div>
      <div className="card-wounds">
        Wounds {@props.woundsCurrent}/{@props.woundsMax}
      </div>
      <div className="card-stats">
        {
          (for name, value of @props.stats
            <div className="card-stat">
              <div className="card-stat-name">{name}</div>
              <div className="card-stat-value">{value}</div>
            </div>)
        }
      </div>
    </div>

  renderDamageOverlay: ->
    <div className="card-overlay">
      <a class="card-overlay-close" onClick={@cancelDamage}>X</a>
      <form onSubmit={@dealDamage}>
        <fieldset>
          <legend>Deal damage</legend>
          <ul>
            <li>
              <label>Damage (e.g. '1d10+2')</label>
              <input ref="inputDamage" type="text" className="card-input" autoFocus={true}/>
            </li>
            <li>
            <label>Penetration</label>
              <input ref="inputPenetration" type="text" className="card-input"/>
            </li>
            <li>
              <label>Target</label>
              <select ref="inputTarget" type="text" className="card-input">
                <option value="head">Head</option>
                <option value="armLeft">Left Arm</option>
                <option value="armRight">Right Arm</option>
                <option value="body">Body</option>
                <option value="legLeft">Left Leg</option>
                <option value="legRight">Right Leg</option>
              </select>
            </li>
            <li>
              <button type="submit" className="btn">Do it!</button>
            </li>
          </ul>
        </fieldset>
      </form>
    </div>

  toggleDamageInput: ->
    @setState damageInput: !@state.damageInput

  dealDamage: (e) ->
    e.preventDefault()
    damageInput = React.findDOMNode(@refs.inputDamage)
    penetrationInput = React.findDOMNode(@refs.inputPenetration)
    targetInput = React.findDOMNode(@refs.inputTarget)
    @props.onDamage(damageInput.value, penetrationInput.value, targetInput.value)
    @setState damageInput: false

  cancelDamage: ->
    @setState damageInput: false

module.exports = UnitCard
