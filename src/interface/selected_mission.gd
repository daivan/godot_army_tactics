extends Node2D

@onready var button_cancel = $ButtonCancel
@onready var button_start_mission = $ButtonStartMission

# Called when the node enters the scene tree for the first time.
func _ready():
	self.button_cancel.pressed.connect(_on_button_cancel_pressed)
	self.button_start_mission.pressed.connect(_on_button_start_mission_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_start_mission_pressed():
	get_tree().change_scene_to_file("res://src/dynamic_battlefield.tscn")

func _on_button_cancel_pressed():
	GameManager.clear_world_map_node()
	set_visible(false)
