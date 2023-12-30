class_name ArmyData extends Resource

@export var unit_array: Array = []

func save() -> void:
	ResourceSaver.save(self, "user://army_data.tres")
	
static func load_or_create() -> ArmyData:
	var res: ArmyData = load("user://army_data.tres") as ArmyData
	
	if !res:
		res = load_new_army()
	
	return res

static func load_new_army() -> ArmyData:
	var army_data = ArmyData.new()
	var unit_data1 = UnitData.new()
	unit_data1.item_slot_1 = 'Longsword'
	army_data.unit_array.append(unit_data1)
	var unit_data2 = UnitData.new()
	army_data.unit_array.append(unit_data2)
	var unit_data3 = UnitData.new()
	army_data.unit_array.append(unit_data3)
	var unit_data4 = UnitData.new()
	army_data.unit_array.append(unit_data4)
	return army_data


static func new_game_army(selected_army: String) -> ArmyData:
	var army_data = ArmyData.new()
	if selected_army == 'army_1':
		var unit_data1 = UnitData.new()
		unit_data1.unit_type = 'axeman'
		army_data.unit_array.append(unit_data1)
		
		var unit_data2 = UnitData.new()
		unit_data2.unit_type = 'axeman'
		army_data.unit_array.append(unit_data2)
		
		var unit_data3 = UnitData.new()
		unit_data3.unit_type = 'axeman'
		army_data.unit_array.append(unit_data3)
	elif selected_army == 'army_2':
		var unit_data1 = UnitData.new()
		unit_data1.unit_type = 'worker'
		army_data.unit_array.append(unit_data1)
		
		var unit_data2 = UnitData.new()
		unit_data2.unit_type = 'worker'
		army_data.unit_array.append(unit_data2)
		
		var unit_data3 = UnitData.new()
		unit_data3.unit_type = 'worker'
		army_data.unit_array.append(unit_data3)
		
		var unit_data4 = UnitData.new()
		unit_data4.unit_type = 'worker'
		army_data.unit_array.append(unit_data4)
		
	elif selected_army == 'army_3':
		var unit_data1 = UnitData.new()
		unit_data1.unit_type = 'peasant'
		army_data.unit_array.append(unit_data1)
		
		var unit_data2 = UnitData.new()
		unit_data2.unit_type = 'peasant'
		army_data.unit_array.append(unit_data2)
		
		var unit_data3 = UnitData.new()
		unit_data3.unit_type = 'peasant'
		army_data.unit_array.append(unit_data3)
		
		var unit_data4 = UnitData.new()
		unit_data4.unit_type = 'peasant'
		army_data.unit_array.append(unit_data4)

		var unit_data5 = UnitData.new()
		unit_data5.unit_type = 'peasant'
		army_data.unit_array.append(unit_data5)
	return army_data
