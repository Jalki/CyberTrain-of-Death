extends KinematicBody2D 

export (int) var Health

export (int) var Exp_Worth

export var velocity = Vector2()

export (float) var Speed_Multi

export (bool) var Jumps

var gravity = 9.8

var state_dead = false

onready var groundCheck = $GroundCheck
var grounded = true

func _ready():
	pass

func _physics_process(delta):
	
	velocity.y += gravity
	velocity.x = lerp(velocity.x, Speed_Multi, .4)
	velocity = move_and_slide(velocity)
	
	if state_dead == false:
		translate(velocity * Speed_Multi * delta)

	if groundCheck.is_colliding():
		grounded = true
	else:
		grounded = false
	
	if state_dead == true:
		queue_free()

#This is for when the enemy leaves the screen, they get oofed and deleted from game and memory! 
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D_area_entered(area):
	if area.has_method("Damaged"):
		area.call("Damaged")
		queue_free()
