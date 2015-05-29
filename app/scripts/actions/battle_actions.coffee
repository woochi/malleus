alt = require("lib/alt")

class BattleActions

  constructor: ->
    @generateActions(
      "startBattle",
      "advanceTurn",
      "regressTurn",
      "selectUnit",
      "useWeapon",
      "rollStat",
      "woundUnit",
      "healUnit",
      "unitDragStart",
      "unitDragEnd"
    )

module.exports = alt.createActions(BattleActions)
