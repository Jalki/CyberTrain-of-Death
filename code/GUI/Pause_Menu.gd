extends Control

#Pause Functionality!
func _input(event):
	if event.is_action_pressed("Pause"):
		var paused = not get_tree().paused
		get_tree().paused = paused
		visible = paused


func _on_Continue_pressed():
	var paused = not get_tree().paused
	get_tree().paused = paused
	visible = paused

func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/UI/Start_Menu.tscn")
