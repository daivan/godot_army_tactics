class_name WorldMapData extends Resource

@export var world_map_node_array: Array = []

func save() -> void:
	ResourceSaver.save(self, "user://world_map_data.tres")
	
static func load_or_create() -> WorldMapData:
	var res: WorldMapData = load("user://world_map_data.tres") as WorldMapData
	
	if !res:
		res = load_new_world_map()
	
	return res

static func load_new_world_map() -> WorldMapData:
	
	var world_map_data = WorldMapData.new()
	
	var node_data1 = WorldMapNodeData.new()
	node_data1.level_name = 'Forest 1'
	node_data1.level = 1
	world_map_data.world_map_node_array.append(node_data1)
	var node_data2 = WorldMapNodeData.new()
	node_data2.level_name = 'City 1'
	node_data2.level = 2
	world_map_data.world_map_node_array.append(node_data2)
	var node_data3 = WorldMapNodeData.new()
	node_data3.level_name = 'Deep 1'
	node_data3.level = 3
	world_map_data.world_map_node_array.append(node_data3)
	var node_data4 = WorldMapNodeData.new()
	node_data4.level_name = 'Ruins 1'
	node_data4.level = 4
	world_map_data.world_map_node_array.append(node_data4)
	var node_data5 = WorldMapNodeData.new()
	node_data5.level_name = 'Dungeon 1'
	node_data5.level = 5
	world_map_data.world_map_node_array.append(node_data5)
	var node_data6 = WorldMapNodeData.new()
	node_data6.level_name = 'Village 1'
	node_data6.level = 6
	world_map_data.world_map_node_array.append(node_data6)
	var node_data7 = WorldMapNodeData.new()
	node_data7.level_name = 'Dark portal 1'
	node_data7.level = 7
	world_map_data.world_map_node_array.append(node_data7)
	var node_data8 = WorldMapNodeData.new()
	node_data8.level_name = 'Forest 2'
	node_data8.level = 1
	world_map_data.world_map_node_array.append(node_data8)
	var node_data9 = WorldMapNodeData.new()
	node_data9.level_name = 'City 2'
	node_data9.level = 2
	world_map_data.world_map_node_array.append(node_data9)
	var node_data10 = WorldMapNodeData.new()
	node_data10.level_name = 'Deep 2'
	node_data10.level = 3
	world_map_data.world_map_node_array.append(node_data10)
	var node_data11 = WorldMapNodeData.new()
	node_data11.level_name = 'Ruins 2'
	node_data11.level = 4
	world_map_data.world_map_node_array.append(node_data11)
	var node_data12 = WorldMapNodeData.new()
	node_data12.level_name = 'Dungeon 2'
	node_data12.level = 5
	world_map_data.world_map_node_array.append(node_data12)
	var node_data13 = WorldMapNodeData.new()
	node_data13.level_name = 'Village 2'
	node_data13.level = 6
	world_map_data.world_map_node_array.append(node_data13)
	var node_data14 = WorldMapNodeData.new()
	node_data14.level_name = 'Dark portal 2'
	node_data14.level = 7
	world_map_data.world_map_node_array.append(node_data14)
	var node_data15 = WorldMapNodeData.new()
	node_data15.level_name = 'Forest 3'
	node_data15.level = 1
	world_map_data.world_map_node_array.append(node_data15)
	var node_data16 = WorldMapNodeData.new()
	node_data16.level_name = 'City 3'
	node_data16.level = 2
	world_map_data.world_map_node_array.append(node_data16)
	var node_data17 = WorldMapNodeData.new()
	node_data17.level_name = 'Deep 3'
	node_data17.level = 3
	world_map_data.world_map_node_array.append(node_data17)
	var node_data18 = WorldMapNodeData.new()
	node_data18.level_name = 'Ruins 3'
	node_data18.level = 4
	world_map_data.world_map_node_array.append(node_data18)
	var node_data19 = WorldMapNodeData.new()
	node_data19.level_name = 'Dungeon 3'
	node_data19.level = 5
	world_map_data.world_map_node_array.append(node_data19)
	var node_data20 = WorldMapNodeData.new()
	node_data20.level_name = 'Village 3'
	node_data20.level = 6
	world_map_data.world_map_node_array.append(node_data20)
	var node_data21 = WorldMapNodeData.new()
	node_data21.level_name = 'Dark portal 3'
	node_data21.level = 7
	world_map_data.world_map_node_array.append(node_data21)	
	return world_map_data

static func get_world_map_data() -> WorldMapData:
	return load_or_create()
