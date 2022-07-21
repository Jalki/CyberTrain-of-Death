extends Area2D

var player = null



func _on_PlayerDetectionZone_body_entered(body):
	if body is Player:
		player = body


func _on_PlayerDetectionZone_body_exited(body):
	if body is Player:
		player = null
	
func can_see_player():
	return player != null
