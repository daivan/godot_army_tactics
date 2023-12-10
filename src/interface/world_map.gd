extends Node2D

var configure_army_scene = preload("res://src/interface/configure_army.tscn")

var battlefield_scene = preload("res://src/battlefield.tscn")

var world_map_node = preload("res://src/interface/world_map_node.tscn")

var world_map_data: WorldMapData

@onready var button_start_mission = $ButtonStartMission


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.button_start_mission.disabled = true
	
	self.world_map_data = WorldMapData.get_world_map_data()
	
	if world_map_data.world_map_node_array.size() > 0:
		draw_army(world_map_data.world_map_node_array)
		
		
func _process(delta):
	if GameManager.get_world_map_node() != null:
		self.button_start_mission.disabled = false
		
func draw_army(world_map_node_array) -> void:
	var count = 1
	for world_map_node_resource in world_map_node_array:
		
		var WorldMapNode = world_map_node.instantiate()
		WorldMapNode.setup(world_map_node_resource)
		WorldMapNode.position.x = count * 70
		WorldMapNode.position.y = 55
		add_child(WorldMapNode)
		count += 1
		pass

func _on_button_configure_army_pressed():
	get_tree().change_scene_to_packed(configure_army_scene)


func _on_button_start_mission_pressed():
	get_tree().change_scene_to_packed(battlefield_scene)
