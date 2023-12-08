extends Node2D


var army_data: ArmyData

var unit_agent = preload("res://src/agent.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	army_data = ArmyData.load_or_create()
	
	if army_data.unit_array.size() > 0:
		spawn_army(army_data.unit_array)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_army(unit_array) -> void:
	var count = 1
	for unit in unit_array:
		
		var UnitAgent = unit_agent.instantiate()
		UnitAgent.setup(unit)
		UnitAgent.position.x = count * 50
		UnitAgent.position.y = 50
		add_child(UnitAgent)
		count += 1
		pass
