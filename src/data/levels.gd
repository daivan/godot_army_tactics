class_name LevelInformation extends Node

const LEVEL_DATA_ARRAY: Dictionary = {
	"level_1": {
		"terrain_type": "ruins",
		"enemy_array": ["wolf","skeleton"]
	},
	"level_2": "",
}

func get_level_by_name(level_key: String) -> LevelData:
	var level_data = self.convert_to_resource(LEVEL_DATA_ARRAY[level_key])
	return level_data


func convert_to_resource(level_dictionary) -> LevelData:
	var level_data = LevelData.new()
	level_data.terrain_type = level_dictionary['terrain_type']
	
	var enemy_array = []
	var enemy_information = EnemyInformation.new()
	for enemy_string in level_dictionary['enemy_array']:
		var enemy_data = enemy_information.get_enemy_by_name(enemy_string)
		enemy_array.append(enemy_data)
		
	level_data.enemy_array = enemy_array
	return level_data
