Immutable = require("immutable")
Specials = require("data/specials")

WeaponTable = React.createClass

  render: ->
    <table className="uv-weapons">
      <thead>
        <th>Name</th>
        <th>Damage</th>
        <th>Pen</th>
        <th>Special</th>
        <th colSpan="3">Actions</th>
      </thead>
      <tbody>
        {@props.weapons.map(@renderWeapon)}
      </tbody>
    </table>

  renderWeapon: (weapon) ->
    rof = weapon.get("rof") or Immutable.List([true, false, false])
    <tr className="uv-weapon">
      <td className="uv-weapon-name">{weapon.get("name")}</td>
      <td className="uv-weapon-damage">{weapon.get("damage")}</td>
      <td className="uv-weapon-damage">{weapon.get("pen")}</td>
      <td className="uv-weapon-damage">
        {if weapon.get("specials")
          <ul className="inline-list uv-weapon-specials">
            {weapon.get("specials").map(@renderSpecial)}
          </ul>
        }
      </td>
      <td>{if rof.get(0)
        <button
          className="btn btn-default btn-sm"
          onClick={@useWeapon.bind(@, weapon, 0)}>Single</button>}</td>
      <td>{if rof.get(1)
        <button
          className="btn btn-default btn-sm"
          onClick={@useWeapon.bind(@, weapon, 1)}>Semi</button>}</td>
      <td>{if rof.get(2)
        <button
          className="btn btn-default btn-sm"
          onClick={@useWeapon.bind(@, weapon, 2)}>Full</button>}</td>
    </tr>

  renderSpecial: (special) ->
    isLeveled = typeof special is "object"
    console.log "NAME", typeof special
    name = if isLeveled then special.first() else special
    level = if isLeveled then special.last() else undefined
    description = Specials[name]
    <li title={description}>
      {name} {if level then "(#{level})"}
    </li>

  useWeapon: (weapon, rof) ->
    @props.useWeapon(weapon, rof)

module.exports = WeaponTable
