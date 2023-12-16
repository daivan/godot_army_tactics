extends Node2D

const WINDOW_MODE_ARRAY:Array[String] = [
	'Window mode',
	'Full screen',
	'borderless full screen',
]

const RESOLUTION_ARRAY: Dictionary = {
	"1152 x 648": Vector2i(1152, 648),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080),
}
	


@onready var option_button_window_mode = $OptionButtonWindowMode
@onready var option_button_resolution = $OptionButtonResolution

# Called when the node enters the scene tree for the first time.
func _ready():
	option_button_window_mode.item_selected.connect(_on_item_selected_option_button_window_mode)
	option_button_resolution.item_selected.connect(_on_item_selected_option_button_resolution)
	
	for window_mode_item in WINDOW_MODE_ARRAY:
		option_button_window_mode.add_item(window_mode_item)
	
	for resolution_item in RESOLUTION_ARRAY:
		option_button_resolution.add_item(resolution_item)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_item_selected_option_button_window_mode(index: int) -> void:
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	elif index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	elif index == 2:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func _on_item_selected_option_button_resolution(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_ARRAY.values()[index])
