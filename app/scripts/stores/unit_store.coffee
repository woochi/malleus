alt = require("lib/alt")
merge = require("object-assign")
_ = require("lodash")

class UnitStore

  constructor: ->
    console.log "CONSTRUCTOR"
    @units = {}

  onCreateUnit: (unit) ->
    id = _.uniqueId()
    @units[id] = unit
    console.log "CREATE", @units

  onDestroyUnit: (id) ->
    console.log "DESTROY"
    @units[id] = undefined

  onUpdateUnit: ({id, changes}) ->
    console.log "UPDATE"
    @units[id] = merge(@units[id], changes)

module.exports = UnitStore
