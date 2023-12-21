extends Node2D
class_name HealthComponent

@export var max_health: int = 100
var current_health: int = 100

@export var animation_player:AnimationPlayer

@onready var progress_bar_current_health = $ProgressBarCurrentHealth

func _ready():
	self.current_health = self.max_health
	self.progress_bar_current_health.max_value = self.max_health
	self.progress_bar_current_health.value = self.current_health
	
func _process(delta):
	self.progress_bar_current_health.value = self.current_health
	
func take_damage(damage_amount: int):
	self.current_health -= damage_amount
	if is_dead() == true:
		animation_player.play('die')

func is_dead() -> bool:
	if self.current_health <= 0:
		return true
	return false
