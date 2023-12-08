extends Node2D

var world_map_scene = preload("res://src/interface/world_map.tscn")

var unit_interface = preload("res://src/interface/unit_interface.tscn")

var army_data: ArmyData

# Called when the node enters the scene tree for the first time.
func _ready():
	army_data = ArmyData.load_or_create()
	
	if army_data.unit_array.size() > 0:
		draw_army(army_data.unit_array)
		

func draw_army(unit_array) -> void:
	var count = 1
	for unit in unit_array:
		
		var UnitInterface = unit_interface.instantiate()
		UnitInterface.setup(unit)
		UnitInterface.position.x = count * 50
		UnitInterface.position.y = 50
		add_child(UnitInterface)
		count += 1
		pass

func _on_button_world_map_pressed():
		get_tree().change_scene_to_packed(world_map_scene)
