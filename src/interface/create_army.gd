extends Node2D

@onready var button_start_game = $ButtonStartGame
@onready var button_select_army_1 = $ButtonSelectArmy1
@onready var button_select_army_2 = $ButtonSelectArmy2
@onready var button_select_army_3 = $ButtonSelectArmy3

@onready var label_army_1 = $LabelArmy1
@onready var label_army_2 = $LabelArmy2
@onready var label_army_3 = $LabelArmy3

var selected_army: String = ''

func _ready():
	button_start_game.disabled = true
	button_start_game.pressed.connect(_on_button_start_game_pressed)
	button_select_army_1.pressed.connect(_on_button_select_army_1_pressed)
	button_select_army_2.pressed.connect(_on_button_select_army_2_pressed)
	button_select_army_3.pressed.connect(_on_button_select_army_3_pressed)

func _process(delta):
	if self.selected_army != '':
		button_start_game.disabled = false
		
func _on_button_start_game_pressed():
	GameManager.start_new_game(self.selected_army)
	get_tree().change_scene_to_file("res://src/interface/world_map.tscn")

func _on_button_select_army_1_pressed():
	self.reset_all_selects()
	self.label_army_1.modulate = Color(0,1,0) 
	self.selected_army = 'army_1'

func _on_button_select_army_2_pressed():
	self.reset_all_selects()
	self.label_army_2.modulate = Color(0,1,0) 
	self.selected_army = 'army_2'

func _on_button_select_army_3_pressed():
	self.reset_all_selects()
	self.label_army_3.modulate = Color(0,1,0) 
	self.selected_army = 'army_3'

func reset_all_selects():
	self.label_army_1.modulate = Color(1,1,1) 
	self.label_army_2.modulate = Color(1,1,1) 
	self.label_army_3.modulate = Color(1,1,1) 
	self.selected_army = ''
