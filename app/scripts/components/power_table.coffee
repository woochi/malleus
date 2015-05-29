Powers = require("data/powers")

PowerTable = React.createClass

  render: ->
    <table className="uv-powers">
      <thead>
        <th>Name</th>
        <th>Action</th>
        <th>Difficulty</th>
        <th>Damage</th>
      </thead>
      <tbody>
        {@props.powers.toArray().map(@renderPower)}
      </tbody>
    </table>

  renderPower: (id, i) ->
    power = Powers[id]
    <tr title={power.description + "\n\n" + power.effect}>
      <td>{power.name}</td>
      <td>{power.action}</td>
      <td>{power.difficulty}</td>
      <td>
        {if power.damage
          "#{power.damage} (PEN #{power.penetration}) (#{power.type})"
        else
          "-"
        }
      </td>
    </tr>

module.exports = PowerTable
