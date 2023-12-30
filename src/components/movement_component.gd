extends NavigationAgent2D
class_name MovementComponent

@export var moveTarget:TargetComponent
@export var attack_range_component:AttackRangeComponent

@onready var NavigationAgent := $"." as NavigationAgent2D

@export var SPEED := 30


func _physics_process(delta):
	if attack_range_component.is_in_range_of_target() == true:
		return
		
	if self.moveTarget != null:
		var direction = get_parent().to_local(NavigationAgent.get_next_path_position()).normalized()
		get_parent().velocity = direction * SPEED
		get_parent().move_and_slide()
	

func update_move_path() -> void:
	if self.moveTarget.get_target() != null:
		self.NavigationAgent.target_position = self.moveTarget.get_target().global_position
		
func _on_update_move_path_timeout():
	update_move_path()
