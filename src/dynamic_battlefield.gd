extends Node2D

var army_data: ArmyData
var level_data: LevelData
var enemy_array: Array = []

var unit_agent = preload("res://src/axeman.tscn")

var enemy_agent = preload("res://src/enemy_agent.tscn")

func _ready():
	self.level_data = LevelData.load()
	self.enemy_array = level_data['enemy_array']

	var terrain_type = self.level_data.terrain_type
	setup_terrain(terrain_type)
	setup_enemies(enemy_array)
	
	self.army_data = ArmyData.load_or_create()
	setup_army(army_data)
		
	
func setup_terrain(terrain_type: String):
	
	
	var tile_map_ruins = load("res://src/tile_map.tscn")
	var tile_map = tile_map_ruins.instantiate()
	#if terrain_type == 'ruins':
	#	var tile_map_grass = load("res://src/tile_map_grass_ruins.tscn")
	#	tile_map = tile_map_grass.instantiate()
	
	add_child(tile_map)

	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nodes_in_group := get_tree().get_nodes_in_group('hero')

	var game_over = true
	# Loop through nodes in the group
	for node in nodes_in_group:
		# Do something with the node
		if node.is_dead == false:
			game_over = false
	
	if game_over == true:
		var lost_battle_scene = $LoseBattleScene
		lost_battle_scene.visible = true



	var enemy_nodes_in_group := get_tree().get_nodes_in_group('enemy')

	var game_win = true
	# Loop through nodes in the group
	for enemy_node in enemy_nodes_in_group:
		# Do something with the node
		if enemy_node.isDead == false:
			game_win = false
	
	if game_win == true:
		var win_battle_scene = $WinBattleScene
		win_battle_scene.visible = true

func setup_army(unit_array) -> void:
	
	if army_data.unit_array.size() <= 0:
		return
		
	var count = 1
	for unit in army_data.unit_array:
		
		var UnitAgent = unit_agent.instantiate()
		UnitAgent.setup(unit)
		UnitAgent.position.x = 50
		UnitAgent.position.y = count * 50 + 100
		add_child(UnitAgent)
		count += 1

func setup_enemies(enemy_array):
	if enemy_array.size() <= 0:
		return
		
	var count = 1
	for enemy in enemy_array:
		
		var new_enemy_agent = enemy_agent.instantiate()
		new_enemy_agent.setup(enemy)
		new_enemy_agent.position.x = 700
		new_enemy_agent.position.y = count * 50 + 100
		add_child(new_enemy_agent)
		count += 1
