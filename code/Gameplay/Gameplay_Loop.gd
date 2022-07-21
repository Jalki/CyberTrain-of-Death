extends Node2D

#Onready var that sets the variable to be the node selected upon loading scene. For cleaner code!
onready var Death_Timer = $GUI_Layer/Death_Timer
onready var Health_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Status_Bars/Health_Bar
onready var Energy_Bar = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Status_Bars/Energy_Bar
onready var Death_Label = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/Death_Time
onready var Pl_Label = $GUI_Layer/GUI/GUIBackground/GuiHBoxCon/TextureRect/Player_Level
onready var Player = $Gameplay_Layer/Player
onready var Spawn = $Gameplay_Layer/Enemy_Spawn/Spawn_Path/Spawn

func _ready():
	New_Game()
	Health_Bar.value = Player.Health
	Energy_Bar.value = Player.Energy

func _physics_process(delta):
	#Pl_Label.text = str(Player.Level)
	pass

func New_Game():
	get_tree().call_group("Player_Timers", "start")
	get_tree().call_group("Enemy_Timers", "start")
	#Pl_Label.text = str(Player.Level)

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

func _on_Enemy_1_timeout():
	Spawn.set_offset(randi())
	var Robo_Bee = EnemyData.Robo_Bee.instance()
	$Gameplay_Layer/Enemy_Spawn.add_child(Robo_Bee)
	Robo_Bee.position = Spawn.position

func _on_Enemy_2_timeout():
	Spawn.set_offset(randi())
	var Robo_Scorpion = EnemyData.Robo_Scorpion.instance()
	$Gameplay_Layer/Enemy_Spawn.add_child(Robo_Scorpion)
	Robo_Scorpion.position = Spawn.position

func _on_Enemy_3_timeout():
	Spawn.set_offset(randi())
	var Robo_Beetle = EnemyData.Robo_Beetle.instance()
	$Gameplay_Layer/Enemy_Spawn.add_child(Robo_Beetle)
	Robo_Beetle.position = Spawn.position

func _on_Enemy_4_timeout():
	Spawn.set_offset(randi())
	var Robo_Beetle = EnemyData.Robo_Beetle.instance()
	$Gameplay_Layer/Enemy_Spawn.add_child(Robo_Beetle)
	Robo_Beetle.position = Spawn.position

func death_calls():
	if Player.position == 0:
		End_Game()
	if Player.Health == 0:
		End_Game()
