extends Area2D

#For Health Points of character. Onces reaches 0, death
export (int) var Health

#For Energy Points of Character. Once reaches 0 or not enough to do action, cant do it
export (int) var Energy

#Level of player.
export (int) var Level

#Reduce Damage by X for Physical Attacks
export (int) var Phy_Def

#Reduce Damage by X for electrical attacks
export (int) var Elec_Def

#Speed of character. base is 1.00!
export (float) var Speed

#Just for movement, look below for more info
var velocity

#Weapon Equipped in First Slot

#Weapon Equipped in Second Slot

#Upgrade to Character! You only get 1 Upgrade per level and max of 4 levels
var Upgrades_Choices = {
	"Fast_Reload" : false,
	"+Phy_Def" : false,
	"+Elec_Def" : false,
	"Increase_Movement" : false,
	"Upgrade_EMP": false,
	"Bigger_EMP" : false,
	"Health_Regen" : false,
	"Faster Stamina_Regen": false
}

#Malus to Character for purchasing upgrades! Every Upgrade you get (Max of 4 since max level is 4!) you take a negative!
var Malus_Choices = {}

signal Damaged

signal Attack

signal Dodge

signal Fire

signal Jump

signal Block

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2()
	get_input()
	translate(velocity * delta)

func get_input():
	if Input.is_action_pressed("Move_Right"):
		velocity.x += (575 * Speed)
	if Input.is_action_pressed("Move_Left"):
		velocity.x -= (575 * Speed)
	if Input.is_action_just_pressed("Dodge"):
		$Player_Collision.disabled = true
	if Input.is_action_just_pressed("Jump"):
		emit_signal("Jump")
	if Input.is_action_just_pressed("Ability 1"):
		pass
	if Input.is_action_just_pressed("Ability 2"):
		pass
	if Input.is_action_just_pressed("Ability 3"):
		pass
	if Input.is_action_just_pressed("Shoot"):
		emit_signal("Fire")

func Check_Equipped():
	pass

func Damaged():
	pass
