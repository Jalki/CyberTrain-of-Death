extends Area2D


#Influence the damaged done by projectile
export (int) var Phy_Dam

export (int) var Elec_Dam

#Influence if the projectile speed
export var velo = Vector2()

func _ready():
	pass

#Deletes nodes upon leaving the screen from memory and game!
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta):
	translate(velo * delta)
