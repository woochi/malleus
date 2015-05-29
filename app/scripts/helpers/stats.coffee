Droll = require("droll")
Strings = require("data/strings")

Range = require("constants/range")
Rof = require("constants/rof")

StatsHelper =

  humanize: (key) ->
    Strings[key] or key

  test: (val) ->
    roll = Droll.roll("1d100").total

    roll: roll
    degrees: @degrees(roll, val)

  bonus: (stat) ->
    Math.floor(stat / 10)

  initiative: (ag) ->
    @bonus(ag) + Droll.roll("1d10").total

  degrees: (roll, target) ->
    diff = target - roll

    if diff < 0
      degrees = -1
    else
      degrees = 1
    degrees += Math.floor(target * 0.1) - Math.floor(roll * 0.1)
    degrees

  rollToLocation: (roll) ->
    if roll < 11
      "head"
    else if roll < 21
      "armRight"
    else if roll < 31
      "armLeft"
    else if roll < 71
      "body"
    else if roll < 86
      "legRight"
    else
      "legLeft"

  rangeModifier: (range) ->
    switch range
      when Range.NORMAL then 10
      when Range.SHORT then 20
      when Range.POINT_BLANK then 30
      else 0

  rofModifier: (rof) ->
    switch rof
      when Rof.FULL_AUTO then 10
      else 0

  hitLocation: (roll) ->
    locationRoll = parseInt((roll + "").split("").reverse().join(""))

    roll: locationRoll
    name: @rollToLocation(locationRoll)

  damage: (weapon, modifier = 0) ->
    Droll.roll(weapon.get("damage")).total + modifier

  attack: (attacker, weapon, rof = 0, modifier = 0) ->
    if weapon.get("class") is "melee"
      @meleeAttack(attacker, weapon, modifier)
    else
      @ballisticAttack(attacker, weapon, rof, modifier)

  ballisticAttack: (attacker, weapon, rof, modifier) ->
    hitRoll = Droll.roll("1d100").total
    degrees = @degrees(hitRoll, attacker.get("stats").get("bs") + modifier)

    hits = 1
    if rof is Rof.SEMI_AUTO
      hits += Math.floor((degrees - 1) / 2)
    else if rof is Rof.FULL_AUTO
      hits = degrees

    roll: hitRoll
    degrees: degrees
    location: @hitLocation(hitRoll)
    damages: (@damage(weapon) for i in [1..hits])

  meleeAttack: (attacker, weapon, modifier) ->
    hitRoll = Droll.roll("1d100").total
    degrees = @degrees(hitRoll, attacker.get("stats").get("ws") + modifier)

    roll: hitRoll
    degrees: degrees
    location: @hitLocation(hitRoll)
    damages: @damage(weapon, @bonus(attacker.get("stats").get("s")))

module.exports = StatsHelper
