module.exports =
  "1":
    name: "Marius"
    woundsMax: 11
    woundsCurrent: 4
    armour:
      head: 4
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 31
      bs: 31
      s: 28
      t: 24
      ag: 31
      int: 40
      per: 27
      wp: 36
      fel: 39
      inf: 40
  "2":
    name: "Newel"
    woundsMax: 9
    woundsCurrent: 9
    armour:
      head: 0
      armLeft: 3
      armRight: 3
      body: 3
      legLeft: 3
      legRight: 3
    stats:
      ws: 35
      bs: 31
      s: 29
      t: 35
      ag: 25
      int: 36
      per: 33
      wp: 44
      fel: 38
      inf: 33
  "3":
    name: "Null"
    woundsMax: 13
    woundsCurrent: 13
    armour:
      head: 4
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 30
      bs: 29
      s: 35
      t: 44
      ag: 31
      int: 36
      per: 36
      wp: 30
      fel: 35
      inf: 24
  "4":
    name: "Oort"
    woundsMax: 13
    woundsCurrent: 13
    armour:
      head: 1
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 28
      bs: 41
      s: 33
      t: 45
      ag: 36
      int: 28
      per: 32
      wp: 33
      fel: 29
      inf: 35
  "5":
    name: "Partheos"
    woundsMax: 12
    woundsCurrent: 12
    armour:
      head: 1
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 36
      bs: 33
      s: 33
      t: 31
      ag: 34
      int: 41
      per: 29
      wp: 29
      fel: 25
      inf: 22
  "6":
    name: "Uriel"
    woundsMax: 11
    woundsCurrent: 4
    armour:
      head: 4
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 32
      bs: 31
      s: 33
      t: 33
      ag: 38
      int: 32
      per: 41
      wp: 24
      fel: 25
      inf: 31
  "7":
    name: "Suvfaeras"
    woundsMax: 33
    woundsCurrent: 33
    armour:
      head: 7
      armLeft: 7
      armRight: 7
      body: 7
      legLeft: 7
      legRight: 7
    stats:
      ws: 52
      bs: 35
      s: 55
      t: 75
      ag: 18
      int: 53
      per: 45
      wp: 55
      fel: 15
      inf: 31
    weapons: [
      class: "melee"
      name: "Claws"
      damage: "1d10+10"
      pen: 2
      specials: [["crippling", 3]]
    ]
    powers: [1, 2, 3, 4, 5]
    talents: [1, 2, 3]
    traits: [[5, 20], [6, 3], 1, [7, 2], 8, 9, [10, 5], [11, 5], [12, 3]]
  "8":
    name: "Somnius Halbrel"
    woundsMax: 22
    woundsCurrent: 22
    armour:
      head: 0
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 40
      bs: 45
      s: 45
      t: 55
      ag: 35
      int: 60
      per: 40
      wp: 55
      fel: 20
      inf: 43
    weapons: [
      class: "pistol"
      name: "Plasma Pistol"
      damage: "1d10+8"
      type: "energy"
      range: 30
      pen: 6
      clip: 10
      reload: 3
      weight: 4
      rof: [true, 2, false]
      availability: "very rare"
      specials: ["maximal", "overheats"]
    ,
      class: "melee"
      name: "Power Maul"
      damage: "1d10+8"
      type: "energy"
      pen: 4
      availability: "very rare"
      specials: ["power field", "shocking"]
    ]
    talents: [4, 5, 6]
    traits: [1, [2, 1], [3, 1], [4, 3]]
  "9":
    name: "Zax Holthane"
    woundsMax: 18
    woundsCurrent: 18
    armour:
      head: 0
      armLeft: 3
      armRight: 3
      body: 3
      legLeft: 3
      legRight: 3
    stats:
      ws: 41
      bs: 50
      s: 37
      t: 43
      ag: 40
      int: 38
      per: 41
      wp: 40
      fel: 37
      inf: 0
    weapons: [
      name: "Bolt Pistol"
      class: "pistol"
      damage: "1d10+6"
      penetration: 5
      range: 30
      reload: "full"
      availability: "very rare"
      weight: 3.5
      clip: 8
      rof: [true, 2, false]
    ,
      name: "Autopistol"
      class: "pistol"
      damage: "1d10+2"
      range: 30
      penetration: 0
      clip: 18
      reload: "full"
      weight: 1.5
      rof: [true, false, 6]
      availability: "average"
    ]
  "10":
    name: "Eldric Havofast"
    woundsMax: 15
    woundsCurrent: 15
    armour:
      head: 0
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 42
      bs: 41
      s: 34
      t: 36
      ag: 41
      int: 37
      per: 38
      wp: 35
      fel: 41
      inf: 0
  "11":
    name: "Babyface Ganger"
    woundsMax: 10
    woundsCurrent: 10
    armour:
      head: 0
      armLeft: 3
      armRight: 3
      body: 3
      legLeft: 3
      legRight: 3
    stats:
      ws: 35
      bs: 35
      s: 30
      t: 35
      ag: 30
      int: 32
      per: 37
      wp: 32
      fel: 38
      inf: 0
  "12":
    name: "Scribe"
    woundsMax: 8
    woundsCurrent: 8
    armour:
      head: 0
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 20
      bs: 20
      s: 25
      t: 25
      ag: 20
      int: 35
      per: 30
      wp: 30
      fel: 25
      inf: 0
  "13":
    name: "Hired Lasgun"
    woundsMax: 10
    woundsCurrent: 10
    armour:
      head: 4
      armLeft: 4
      armRight: 4
      body: 4
      legLeft: 4
      legRight: 4
    stats:
      ws: 35
      bs: 37
      s: 35
      t: 41
      ag: 32
      int: 28
      per: 35
      wp: 32
      fel: 25
      inf: 0
  "14":
    name: "Desoleum Cult Mechanicus Adept"
    woundsMax: 9
    woundsCurrent: 9
    armour:
      head: 1
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 30
      bs: 30
      s: 30
      t: 35
      ag: 25
      int: 35
      per: 30
      wp: 35
      fel: 20
      inf: 0
    weapons: [
      name: "Lasgun"
      class: "basic"
      range: 100
      damage: "1d10+3"
      pen: 0
      clip: 60
      reload: "full"
      weight: 4
      rof: [true, 3, false]
      availability: "common"
    ,
      name: "Great Weapon"
      class: "melee"
      weight: 7
      availability: "scarce"
      damage: "2d10+3"
    ]
    talents: [6]
  "15":
    name: "Raevan"
    woundsMax: 9
    woundsCurrent: 9
    armour:
      head: 1
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 30
      bs: 30
      s: 30
      t: 35
      ag: 35
      int: 35
      per: 30
      wp: 35
      fel: 20
      inf: 0
  "16":
    name: "Lazarus"
    woundsMax: 9
    woundsCurrent: 9
    armour:
      head: 1
      armLeft: 1
      armRight: 1
      body: 1
      legLeft: 1
      legRight: 1
    stats:
      ws: 30
      bs: 30
      s: 30
      t: 35
      ag: 31
      int: 35
      per: 30
      wp: 35
      fel: 20
      inf: 0
