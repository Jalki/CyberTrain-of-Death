extends Node

#Health Upgrade: Increases HP by X%
#Energy Upgrade: Increase Energy by X%
#Increase Movement Speed: Increase Speed by X%
#Jump Height: Increase Jump Height by +X (integer!)
#Health Regen: Regen 4% of HP per 10 seconds
#Energy Regen: Regen 5% of Energy per 10 seconds

export var health = 100
export var energy = 150
export var moveSpeed = 100
export var jumpHeight = -420
export var health_regen = 10#seconds
export var energy_regen = 10#seconds

export var def_health = 100
export var def_energy = 150
export var def_moveSpeed = 100
export var def_jumpHeight = -420
export var def_health_regen = 10#seconds
export var def_energy_regen = 10#seconds

var health_upgrades = 1
var energy_upgrades = 1
var moveSpeed_upgrades = 1
var jumpHeight_upgrades = 1
var health_regen_upgrades = 1
var energy_regen_upgrades = 1

func upgrade(type, level):
	if type == "health":
		health = def_health
		health += 25*level
	if type == "energy":
		energy = def_energy
		energy += 25*level
	if type == "moveSpeed":
		moveSpeed = def_moveSpeed
		moveSpeed = 75*level
	if type == "jumpHeight":
		jumpHeight = def_jumpHeight
		jumpHeight -= 30*level
	if type == "healthRegen":
		health_regen = def_health_regen
		health_regen -= 1.5*level
	if type == "energyRegen":
		energy_regen = def_energy_regen
		energy_regen -= 1.5*level
