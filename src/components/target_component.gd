extends Node
class_name TargetComponent

@export var target:Node2D
@export var target_group:String

func _ready():
	#if self.target_group.is_empty() == true:
	#	self.target_group = 'enemy'
	get_new_target()
	
func _process(delta):

	if self.target == null:
		print(self.target)
		get_new_target()

func get_target():
	return self.target

func get_new_target():
	var target_array = get_tree().get_nodes_in_group(self.target_group)
	print(target_array)
	for first_target in target_array:
		self.target = first_target
