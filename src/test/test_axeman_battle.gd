extends Node2D


@onready var axeman = $Axeman
@onready var enemy_axeman = $EnemyAxeman

# Called when the node enters the scene tree for the first time.
func _ready():
	axeman.add_to_group('hero')
	enemy_axeman.add_to_group('enemy')
	
	axeman.target_component.target_group = "enemy"
	#enemy_axeman.target_component.target_group = "hero"
	
	#enemy_axeman.target_component.target = axeman
	#axeman.target_component.target = enemy_axeman
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
