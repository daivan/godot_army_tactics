extends Node2D

var world_map_node: WorldMapNodeData
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.get_world_map_node() == self.world_map_node:
		var sprite = $Sprite2D
		sprite.modulate = Color(.1, 1, .1)
	else:
		var sprite = $Sprite2D
		sprite.modulate = Color(1, 1, 1)
	


func setup(world_map_node_resource):
	self.world_map_node = world_map_node_resource
	var node_name_label = $Label
	node_name_label.text = world_map_node_resource.level_name


func _on_button_select_pressed():
	GameManager.set_world_map_node(self.world_map_node)
	
	var selected = GameManager.get_world_map_node()
	print(selected)
