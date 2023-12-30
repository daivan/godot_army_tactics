extends Node2D
@onready var axeman = $Axeman
@onready var enemy_axeman = $EnemyAxeman

# Called when the node enters the scene tree for the first time.
func _ready():
	axeman.add_to_group('hero')
	enemy_axeman.add_to_group('enemy')
	
	axeman.target_component.target_group = "enemy"
	enemy_axeman.target_component.target_group = "hero"
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nodes_in_group := get_tree().get_nodes_in_group('hero')

	var game_over = true
	# Loop through nodes in the group
	for node in nodes_in_group:
		# Do something with the node
		if node.is_dead() == false:
			game_over = false
	
	if game_over == true:
		var lost_battle_scene = $LoseBattleScene
		lost_battle_scene.visible = true

	var enemy_nodes_in_group := get_tree().get_nodes_in_group('enemy')
	
	var game_win = true
	# Loop through nodes in the group
	for enemy_node in enemy_nodes_in_group:
		# Do something with the node
		if enemy_node.is_dead() == false:
			game_win = false
	
	if game_win == true:
		var win_battle_scene = $WinBattleScene
		win_battle_scene.visible = true

