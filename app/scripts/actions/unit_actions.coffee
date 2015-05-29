alt = require("lib/alt")

class UnitActions

  constructor: ->
    @generateActions(
      "createAlly",
      "destroyAlly",
      "updateAlly",
      "createEnemy",
      "destroyEnemy",
      "updateEnemy"
    )

module.exports = alt.createActions(UnitActions)
