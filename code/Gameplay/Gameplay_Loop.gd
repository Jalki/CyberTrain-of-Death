extends Node2D

#Onready var that sets the variable to be the node selected upon loading scene. For cleaner code!
onready var Death_Timer = $GUI_Layer/Death_Timer
onready var Health_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Health_Bar
onready var Energy_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Energy_Bar
onready var Death_Label = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Death_Time
onready var Pl_Label = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Player_Level
onready var Player = $Gameplay_Layer/Player

func _ready():
	New_Game()

func _physics_process(delta):
	#Check_Pl()
	#Death_Label.text = str(Death_Timer.wait_time)
	pass

func New_Game():
	get_tree().call_group("Player_Timers", "start")
	get_tree().call_group("Enemy_Timers", "start")

func End_Game():
	get_tree().change_scene("res://scenes/UI/Start_Menu.tscn")

func Final_Part():
	pass

func Check_Pl():
	if Player.Level >= 0:
		End_Game()
	elif Player.Level >= 5:
		Final_Part()
	else:
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
