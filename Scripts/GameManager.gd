extends Node3D

# ---------- VARIABLES ---------- #

var score = 0
var items_collected = 0
var items_required = 0

signal items_changed(collected, required)
signal all_items_collected

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	show_mouse_cursor()

# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func add_score():
	score += 1

# Called by each level's root script on _ready() to reset the item counter
func register_level(required: int):
	items_collected = 0
	items_required = required
	items_changed.emit(items_collected, items_required)

# Called by collectible items (e.g. Coin.gd) instead of add_score() directly
func collect_item():
	items_collected += 1
	add_score()
	items_changed.emit(items_collected, items_required)
	if items_collected >= items_required:
		all_items_collected.emit()
