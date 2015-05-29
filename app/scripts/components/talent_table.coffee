Talents = require("data/talents")

TalentTable = React.createClass

  render: ->
    <table className="uv-talents">
      <thead>
        <th>Name</th>
        <th>Action</th>
        <th>Difficulty</th>
        <th>Damage</th>
      </thead>
      <tbody>
        {@props.talents.toArray().map(@renderTalent)}
      </tbody>
    </table>

  renderTalent: (id, i) ->
    talent = Talents[id]
    <tr title={talent.description + "\n\n" + talent.effect}>
      <td>{talent.name}</td>
      <td>{talent.action}</td>
      <td>{talent.difficulty}</td>
      <td>
        {if talent.damage
          "#{talent.damage} (PEN #{talent.penetration}) (#{talent.type})"
        else
          "-"
        }
      </td>
    </tr>

module.exports = TalentTable
