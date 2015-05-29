Immutable = require("immutable")
Stats = require("models/stats")
_ = require("lodash")

Unit = Immutable.Record
  id: undefined
  name: "Unknown"
  woundsMax: 11
  woundsCurrent: 11
  stats: Stats()
  weapons: Immutable.List()
  powers: Immutable.List()
  talents: Immutable.List()
  traits: Immutable.List()
  initiative: 0

module.exports = Unit
