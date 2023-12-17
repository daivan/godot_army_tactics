class_name LevelData extends Resource

var terrain_type: String = "ruins"
var enemy_array: Array = []
		
static func load() -> LevelData:
	var level_data = load_new_level()
	return level_data

static func load_new_level() -> LevelData:
	
	var level_information = LevelInformation.new()
	var level_dictionary = level_information.get_level_by_name('level_1')
	
	var level_data = LevelData.new()
	level_data.terrain_type = level_dictionary['terrain_type']
	level_data.enemy_array = level_dictionary['enemy_array']
	
	return level_data
