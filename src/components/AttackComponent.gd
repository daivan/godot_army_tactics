extends Node2D
class_name AttackComponent

@export var animation_player:AnimationPlayer
@export var health_component:HealthComponent
@export var attackRangeComponent:AttackRangeComponent
@export var targetComponent:TargetComponent

var can_attack: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.can_attack = true
	if self.health_component.is_dead() == true:
		self.can_attack = false

func _on_attack_timer_timeout():
	if self.can_attack == true && self.targetComponent != null && self.targetComponent.get_target().is_dead() == false:
		
		if attackRangeComponent.isInAttackRange == true:
			print('Axeman is attacking')
			animation_player.play('attack')
			self.targetComponent.get_target().take_damage(10)
		
