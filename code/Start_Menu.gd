extends Control


func _on_Start_pressed():
	pass # Replace with function body.

func _on_Settings_toggled(button_pressed):
	get_tree().change_scene("res://scenes/UI/Settings.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/UI/Credits.tscn")
