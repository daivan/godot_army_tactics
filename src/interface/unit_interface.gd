extends Node2D

func setup(unit_data: UnitData):
	$LabelName.text = unit_data.name
	

	if unit_data.item_slot_1 != '':
		var new_texture = load("res://assets/items/longsword.png")
		$SpriteItemSlot1.texture = new_texture

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
