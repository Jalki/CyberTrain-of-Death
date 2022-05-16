extends KinematicBody2D

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

const bullet_scene = preload("res://scenes/Items/Bullet.tscn")

var velocity = Vector2()
var moveSpeed = 100
var gravity = 9.8
var target_speed = 0.0
var jump_speed = -225
var grounded = true

onready var groundCheck = $GroundCheck
onready var firePos = $Firepos

func _ready():
	pass

func _physics_process(delta):
	get_input()
	velocity.y += gravity
	velocity.x = lerp(velocity.x, target_speed, .4)
	velocity = move_and_slide(velocity)
	if groundCheck.is_colliding():
		grounded = true
	else:
		grounded = false

func get_input():
	target_speed = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * moveSpeed
	if Input.is_action_just_pressed("Dodge"):
		$Player_Collision.disabled = true
	if Input.is_action_just_pressed("Jump") && grounded:
		emit_signal("Jump")
		jump()
	if Input.is_action_just_pressed("Ability 1"):
		pass
	if Input.is_action_just_pressed("Ability 2"):
		pass
	if Input.is_action_just_pressed("Ability 3"):
		pass
	if Input.is_action_just_pressed("Shoot"):
		emit_signal("Fire")
		shoot()

func jump():
	velocity.y += jump_speed

func shoot():
	var bullet = bullet_scene.instance()
	bullet.position = firePos.global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.apply_impulse(Vector2(), Vector2(1500, 0).rotated(rotation))
	get_tree().current_scene.add_child(bullet)

func Check_Equipped():
	pass

func Damaged():
	pass
