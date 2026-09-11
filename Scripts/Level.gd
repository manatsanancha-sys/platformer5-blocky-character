extends Node3D

# ---------- VARIABLES ---------- #

# Set this in the Inspector to the number of Coin nodes placed in this scene
@export var required_items: int = 0

# ---------- FUNCTIONS ---------- #

func _ready():
	GameManager.register_level(required_items)
