extends Node2D

var battlefield_scene : PackedScene  = preload("res://src/battlefield.tscn")
var configure_army_scene : PackedScene  = preload("res://src/interface/configure_army.tscn")

var WorldMapNodeClass = preload("res://src/interface/world_map_node.tscn")

var world_map_data: WorldMapData

func _ready():
	world_map_data = WorldMapData.load_or_create()
	
	if world_map_data.world_map_node_array.size() > 0:
		draw_army(world_map_data.world_map_node_array)
		
func draw_army(unit_array) -> void:
	var count = 1
	for unit in unit_array:
		
		var world_map_node = WorldMapNodeClass.instantiate()
		world_map_node.setup(unit)
		world_map_node.position.x = count * 50
		world_map_node.position.y = 50
		add_child(world_map_node)
		count += 1
		pass


func _on_button_configure_army_pressed():
	get_tree().change_scene_to_packed(configure_army_scene)


func _on_button_start_mission_pressed():
	get_tree().change_scene_to_packed(battlefield_scene)
