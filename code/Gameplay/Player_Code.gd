extends KinematicBody2D

signal Damaged

signal Attack

signal Fire

signal Jump

signal Block

onready var Animations = $AnimatedSprite

var Level = 1

var Health = 100

var Energy = 150

const bullet_scene = preload("res://scenes/Items/Bullet.tscn")
onready var player_stats = $Player_Stats

var velocity = Vector2()
var moveSpeed = 100
var gravity = 9.8
var target_speed = 0.0
var jump_speed = -225
var grounded = true

onready var groundCheck = $GroundCheck
onready var firePos = $Firepos

func _physics_process(delta):
	get_input()
	state_machine()
	velocity.y += gravity
	velocity.x = lerp(velocity.x, target_speed, .4)
	velocity = move_and_slide(velocity)
	if groundCheck.is_colliding():
		grounded = true
	else:
		grounded = false

func state_machine():
	if Input.is_action_pressed("Move_Left") or Input.is_action_pressed("Move_Right"):
		Animations.play("Run")
	elif Input.is_action_just_pressed("Shoot"):
		Animations.play("Shoot")
	else:
		Animations.play("Idle")

func get_input():
	target_speed = (Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")) * moveSpeed
	if Input.is_action_just_pressed("Jump") && grounded:
		emit_signal("Jump")
		jump()
		$Jump_SFX.play()
	if Input.is_action_just_pressed("Shoot"):
		emit_signal("Fire")
		shoot()
		$Shoot_SFX_1.play()

func jump():
	velocity.y += jump_speed

func shoot():
	var bullet = bullet_scene.instance()
	bullet.position = firePos.global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.apply_impulse(Vector2(), Vector2(1500, 0).rotated(rotation))
	get_tree().current_scene.add_child(bullet)
