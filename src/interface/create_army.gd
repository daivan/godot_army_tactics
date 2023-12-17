extends Node2D

@onready var button_start_game = $ButtonStartGame
@onready var button_select_army_1 = $ButtonSelectArmy1
@onready var label_army_1 = $LabelArmy1


var selected = false

func _ready():
	button_start_game.disabled = true
	button_start_game.pressed.connect(_on_button_start_game_pressed)
	button_select_army_1.pressed.connect(_on_button_select_army_1_pressed)

func _process(delta):
	if selected == true:
		button_start_game.disabled = false
		
func _on_button_start_game_pressed():
	GameManager.start_new_game()
	get_tree().change_scene_to_file("res://src/interface/world_map.tscn")

func _on_button_select_army_1_pressed():
	self.label_army_1.modulate = Color(0,1,0) 
	self.selected = true
