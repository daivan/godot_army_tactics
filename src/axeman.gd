extends CharacterBody2D

var is_dead: bool = false
var current_health: int = 100

@export var target_component: TargetComponent

func _ready():
	#target_component.target_group = 'enemy'
	pass

func setup(unit_data):
	#self.add_to_group('hero')
	pass

func get_is_dead():
	return self.is_dead

func check_if_dead():
	if self.current_health < 1:
		self.is_dead = true
	
