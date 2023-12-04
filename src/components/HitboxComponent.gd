extends Area2D

@export var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func damage(attack: AttackComponent):
	if health_component:
		health_component.damage(attack)
