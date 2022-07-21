extends Control

func _ready():
	SoundTrackPlayer.play_type(SoundTrackPlayer.Type.Menu)

func _on_Start_pressed():
	get_tree().change_scene("res://scenes/Gameplay/Gamescenes/Main_Game.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/UI/Credits.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://scenes/UI/Settings.tscn")
