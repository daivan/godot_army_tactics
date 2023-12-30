extends Node


func generate_level() -> WorldMapNodeData:
	var node_data = WorldMapNodeData.new()
	node_data.level_name = 'Forest 1'
	node_data.level = 1
	return node_data
