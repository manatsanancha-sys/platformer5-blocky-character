extends Control

# ---------- VARIABLES ---------- #

@onready var coinsLabel = $CoinsLabel

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	coinsLabel.text = "%d / %d" % [GameManager.items_collected, GameManager.items_required] # Items collected in this level vs required
