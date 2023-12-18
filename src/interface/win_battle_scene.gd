extends Node2D

#var user_preferences: UserPreferences

# Called when the node enters the scene tree for the first time.
func _ready():
	#print('whats up from autoloads: '+str(GameManager.wave))
	#print(GameManager.getPlayer())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	GameManager.win_battlefield()

	if GameManager.has_beat_last_level():
		get_tree().change_scene_to_file("res://src/interface/the_end.tscn")
		return
	else:
		get_tree().change_scene_to_file("res://src/interface/world_map.tscn")
