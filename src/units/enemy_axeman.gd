extends CharacterBody2D

var current_health: int = 20

@onready var sprite_tile_map = $SpriteTileMap

@export var target_component: TargetComponent
@export var health_component: HealthComponent

func _ready():
	#self.health_component.max_health = 20
	#self.health_component.current_health = self.current_health
	pass

func setup(unit_data):
	#self.add_to_group('hero')
	pass

func is_dead():
	return self.health_component.is_dead()
	
func _process(delta):
	var velocity = get_velocity()
	if velocity.x < 0:
		self.sprite_tile_map.flip_h = true
	elif velocity.x > 0:
		self.sprite_tile_map.flip_h = false

func take_damage(damage):
	self.health_component.take_damage(damage)
