extends Node2D

@onready var button_settings = $ButtonSettings

func _ready():
	if GameManager.is_game_in_progress() == true:
		var button_continue = $ButtonContinue
		button_continue.disabled = false

func _on_button_pressed():
	GameManager.start_new_game()
	get_tree().change_scene_to_file("res://src/interface/world_map.tscn")
