extends Node

var wave: int = 1
var enemies_remaining: int = 1
var spawn_count: int = 0

var world_map_data: WorldMapData

var selected_world_map_node:WorldMapNodeData

var current_level = 1
var gold: int = 0

var beaten_level_names_array: Array = []

var current_army: ArmyData

func getPlayer() -> Array:
	return [10, 20, 30]


func clear_world_map_node() -> void:
	self.selected_world_map_node = null
	
func set_world_map_node(world_map_node) -> void:
	self.selected_world_map_node = world_map_node
	
func get_world_map_node() -> WorldMapNodeData:
	return self.selected_world_map_node

func get_current_level() -> int:
	return self.current_level


# --- Function start_new_game
#
# Restart the game and reset everything
# Generate the army
#
# Returns:
# - void
func start_new_game(selected_army: String) -> void:
	self.world_map_data = WorldMapData.get_world_map_data()
	self.current_level = 1
	self.gold = 0
	self.beaten_level_names_array = []
	
	self.current_army = ArmyData.new_game_army(selected_army)



# --- Function win_battlefield
#
# This gets triggered after you've won a battle and have clicked on continue
# We add the beaten level in the array and save the game
#
# Returns:
# - void
func win_battlefield() -> void:
	self.current_level += 1
	add_to_beaten_level_names(self.selected_world_map_node.level_name)
	self.add_gold(10) # Should come from self.selected_world_map_node
	SaveLoadManager.save_world_map_data(self.world_map_data)
	self.clear_world_map_node()
	
func add_gold(earned_gold: int):
	self.gold += earned_gold
	

func add_to_beaten_level_names(level_name) -> void:
	self.beaten_level_names_array.append(level_name)
	
func get_world_map() -> WorldMapData:
	return self.world_map_data

func get_beaten_level_names_array() -> Array:
	return self.beaten_level_names_array
	
func has_beat_last_level() -> bool:
	if self.current_level == 8:
		return true
	return false
	
func is_game_in_progress() -> bool:
	if SaveLoadManager.does_save_file_exist() == true:
		return true
	return false

func get_army() -> ArmyData:
	return self.current_army
