extends Area2D

export (int) var Health

export (int) var Energy

export (int) var Exp_Worth

export (int) var Phy_Def

export (int) var Elec_Def

export var velocity = Vector2()

export (float) var Speed_Multi

export (bool) var Jumps

var state_dead = false


func _ready():
	pass

func _physics_process(delta):
	if state_dead == false:
		translate(velocity * Speed_Multi * delta)

#This is for when the enemy leaves the screen, they get oofed and deleted from game and memory! 
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
