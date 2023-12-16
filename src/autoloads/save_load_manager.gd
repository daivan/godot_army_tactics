extends Node

var army_data_resource_path = "user://army_data.tres"
var world_map_data_resource_path = "user://world_map_data.tres"

func does_save_file_exist() -> bool:
	if ResourceLoader.exists(world_map_data_resource_path):
		return true
	return false

func load_world_map_data():
	if ResourceLoader.exists(world_map_data_resource_path):
		return load(world_map_data_resource_path)
	return null

func save_world_map_data(world_map_data: WorldMapData):
	ResourceSaver.save(world_map_data, self.world_map_data_resource_path)
