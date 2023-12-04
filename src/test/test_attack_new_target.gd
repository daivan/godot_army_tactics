extends Node2D

# Load the scene
var hero = preload("res://src/agent.tscn")

# Function to spawn the node
func spawn_node():
	# Create an instance of the scene
	var new_hero = hero.instantiate()
	
	new_hero.position.x = 10
	new_hero.position.y = 10
	# Add the new instance as a child to this node or any other node
	add_child(new_hero)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_node()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
