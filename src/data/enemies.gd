class_name EnemyInformation extends Node

const ENEMY_DATA_ARRAY: Dictionary = {
	"wolf": {
		"terrain_type": "ruins",
		"enemy_array": [
			{
				"name": "enemy 1",
				"health": 100
			},
			{
				"name": "enemy 1",
				"health": 100
			}
		]
	},
	"skeleton": {
		"terrain_type": "ruins",
		"enemy_array": []
	}
}

func get_enemy_by_name(enemy_key: String) -> EnemyData:
	var enemy_data = convert_to_resource(ENEMY_DATA_ARRAY[enemy_key])
	return enemy_data

func convert_to_resource(enemy_dictionary) -> EnemyData:
	var enemy_data = EnemyData.new()
	return enemy_data
