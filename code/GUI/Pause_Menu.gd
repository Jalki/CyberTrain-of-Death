extends Control

#Pause Functionality!
func _input(event):
	if event.is_action_pressed("Pause"):
		var paused = not get_tree().paused
		get_tree().paused = paused
		visible = paused
