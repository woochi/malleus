Immutable = require("immutable")

Weapon = Immutable.Record
  name: "Unknown"
  class: "ranged"
  damage: "1d5+2"
  range: 0
  penetration: 0
  reload: "full"
  weight: 0
  availability: "average"

module.exports = Weapon
