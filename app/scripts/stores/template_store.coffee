alt = require("lib/alt")
units = require("data/units")
Immutable = require("immutable")
immutable = require("alt/utils/ImmutableUtil")
Unit = require("models/unit")

class TemplateStore

  state: Immutable.fromJS(units)

module.exports = alt.createStore(immutable(TemplateStore))
