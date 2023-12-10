class_name AttackRangeComponent extends Area2D

@export var targetComponent:TargetComponent

var isInAttackRange: bool = false
var bodiesInRange : Array = []

func _process(delta):
	if targetComponent.target in bodiesInRange:
		self.isInAttackRange = true
		print('is it there now?')
	else:
		self.isInAttackRange = false
		
func _on_body_entered(body):
	if body.is_in_group(targetComponent.target_group):
		self.bodiesInRange.append(body)



func _on_body_exited(body):
	if body.is_in_group(targetComponent.target_group):
		self.bodiesInRange.erase(body)
