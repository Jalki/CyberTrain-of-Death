extends Node

#For Health Points of character. Onces reaches 0, death
export (int) var Health

#For Energy Points of Character. Once reaches 0 or not enough to do action, cant do it
export (int) var Energy

#Level of player.
export (int) var Level
#Max Level
var Max_Level = 4

#Reduce Damage by X for Physical Attacks
export (int) var Phy_Def

#Reduce Damage by X for electrical attacks
export (int) var Elec_Def

#Weapon Equipped in First Slot

#Weapon Equipped in Second Slot

#Upgrade to Character! You only get 1 Upgrade per level and max of 4 levels
var Upgrades_Choices = {
	
}

#Malus to Character for purchasing upgrades! Every Upgrade you get (Max of 4 since max level is 4!) you take a negative!
var Malus_Choices = {}

signal Damaged

signal Attack

signal Dodge

signal Block

func _ready():
	pass

func Check_Equipped():
	pass

func Damaged():
	pass
