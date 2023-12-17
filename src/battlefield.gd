extends Node2D


var army_data: ArmyData

var unit_agent = preload("res://src/axeman.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	army_data = ArmyData.load_or_create()
	
	if army_data.unit_array.size() > 0:
		spawn_army(army_data.unit_array)

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

func spawn_army(unit_array) -> void:
	var count = 1
	for unit in unit_array:
		
		var UnitAgent = unit_agent.instantiate()
		UnitAgent.setup(unit)
		UnitAgent.position.x = count * 50
		UnitAgent.position.y = 50
		add_child(UnitAgent)
		count += 1
		pass
