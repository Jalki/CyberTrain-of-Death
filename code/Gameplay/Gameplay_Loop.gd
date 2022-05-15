extends Node2D

#Onready var that sets the variable to be the node selected upon loading scene. For cleaner code!
onready var Death_Timer = $GUI_Layer/Death_Timer
onready var Health_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Health_Bar
onready var Energy_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Energy_Bar
onready var Death_Label = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Death_Time

func _ready():
	New_Game()

func _physics_process(delta):
	Death_Label.text = Death_Timer.wait_time

func New_Game():
	Death_Timer.start()

func End_Game():
	get_tree().change_scene("res://scenes/UI/Start_Menu.tscn")

func Pause():
	pass

#Upon Player firing, a projectile is created based on what weapon said player is using!
func _on_Player_Fire():
	pass # Replace with function body.
#Upon Player Jumping, a sound/animation is then played
func _on_Player_Jump():
	pass # Replace with function body.
#Upon Player Dodging, invunerability 
func _on_Player_Dodge():
	pass # Replace with function body.
#Upon Player firing, projectile is created and damage is dealt
func _on_Player_Attack():
	pass # Replace with function body.

func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/UI/Start_Menu.tscn")
