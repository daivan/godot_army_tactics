extends Node

var wave: int = 1
var enemies_remaining: int = 1
var spawn_count: int = 0

var world_map_data: WorldMapData

var selected_world_map_node:WorldMapNodeData



func getPlayer() -> Array:
	return [10, 20, 30]


func set_world_map_node(world_map_node):
	self.selected_world_map_node = world_map_node
	
func get_world_map_node():
	return self.selected_world_map_node

func start_new_game():
	self.world_map_data = WorldMapData.get_world_map_data()
	print('starting new game...')
	
func get_world_map() -> WorldMapData:
	return self.world_map_data
