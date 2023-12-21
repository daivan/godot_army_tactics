extends CharacterBody2D

var is_dead: bool = false
var current_health: int = 100

@onready var sprite_tile_map = $SpriteTileMap

@export var target_component: TargetComponent
@export var health_component: HealthComponent

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
	
func _process(delta):
	var velocity = get_velocity()
	if velocity.x < 0:
		self.sprite_tile_map.flip_h = true
	elif velocity.x > 0:
		self.sprite_tile_map.flip_h = false

func take_damage(damage):
	self.health_component.take_damage(damage)
