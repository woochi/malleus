module.exports =
  1:
    name: "Haemorrhage"
    description: "Drawing on his mastery of the living body, the biomancer accelerates his victim’s heart rate beyond the bounds of biological possibility. Betrayed by his own body, the target’s blood boils over, flooding his brain and bursting his over-taxed veins. Those nearby have their own hearts caught in the unnatural rhythm, suffering the same fate."
    action: "half"
    difficulty: -10
    opposed: true
    range: "10m * psy rating"
    sustained: false
    subtype: "Attack, Concentration"
    effect: "The psyker nominates a single target in range and line of sight who opposes this power with a Toughness test. If the target fails to resist the power, it suffers Energy damage equal to the psyker’s psy rating, plus one additional damage per degree of failure on its Toughness test; this damage ignores Toughness bonus and Armour. If this damage successfully kills the target, the psyker may immediately recast this psychic power as a Free Action on any legal target within 5 metres of the original target."
  2:
    name: "Smite"
    description: "Drawing on the electric field of his own body, the psyker projects crackling bolts of bio-lightning, transforming his very life force into destructive energy. Diviners often claim that one can tell much about the state of a biomancer’s soul from the colour and"
    type: "Barrage"
    action: "half"
    difficulty: 0
    range: "20m * psy rating"
    sustained: no
    damage: "1d10+PR"
    penetration: "4"
  3:
    name: "Spontaneous Combustion"
    description: "In one of the purest displays of his power, the psyker ignites his enemies, burning them alive. The target’s blood boils and flesh smoulders, and as the psyker’s rage reaches its pinnacle, the target’s body begins to explode in blasts of ash and flame."
    type: "Bolt"
    action: "half"
    difficulty: 10
    range: "20m * psy rating"
    sustained: false
    subtype: "Attack"
    damage: "1d10+2+2xPR"
    penetration: 0
    special: ["flame"]
  4:
    name: "Telekine Shield"
    description: "Using the energy of the Warp, the psyker erects a wall of tangible force that moves with him. The shimmering barrier stops bullets and deflects blades, but as more and more kinetic energy is directed at him, the psyker’s mental shield wears down."
    action: "half"
    difficulty: 20
    sustained: "free"
    subtype: "Concentration"
    effect: "For the duration of the power, all of the psyker’s Hit Locations count as being protected by cover with an Armour Value equal to half this power’s psy rating. This shield can be damaged just like normal cover by damage that exceeds the shield’s Armour Value (see page 229). If the shield is reduced to 0 Armour points, the power stops, and is no longer sustained."
  5:
    name: "Warp Speed"
    description: "Tapping into the power of the Empyrean, the psyker suffuses his body with energy, pushing himself beyond physical limits. While under the effects of this power, the psyker moves with unbelievable speed, ensuring that no heretic is swift enough to escape justice."
    action: "half"
    difficulty: -10
    range: "self"
    sustained: "free"
    subtype: "Concentration"
    effect: "The psyker gains the Unnatural Weapon Skill, Unnatural Ballistic Skill, and Unnatural Agility traits, all at values equal to his psy rating."
