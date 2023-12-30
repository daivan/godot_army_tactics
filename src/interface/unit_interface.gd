extends Node2D

func setup(unit_data: UnitData):
	
	$LabelName.text = unit_data.name
	
	self.set_correct_unit_type(unit_data.unit_type)

	if unit_data.item_slot_1 != '':
		var new_texture = load("res://assets/items/longsword.png")
		$SpriteItemSlot1.texture = new_texture



func set_correct_unit_type(unit_type: String) -> void:
	var new_unit_type_texture = null
	if unit_type == 'axeman':
		new_unit_type_texture = load("res://assets/characters/profile/axeman_profile.png")
	elif unit_type == 'peasant':
		new_unit_type_texture = load("res://assets/characters/profile/peasant_profile.png")
	elif unit_type == 'worker':
		new_unit_type_texture = load("res://assets/characters/profile/worker_profile.png")
	else:
		new_unit_type_texture = load("res://assets/characters/profile/axeman_profile.png")
		
	$SpriteUnitType.texture = new_unit_type_texture
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
