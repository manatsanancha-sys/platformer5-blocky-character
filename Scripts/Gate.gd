extends StaticBody3D

# ---------- FUNCTIONS ---------- #

# Invisible wall blocking the way to the Goal island until every item in the
# level has been collected. GameManager resets items_collected to 0 whenever
# a level is (re)loaded, so the gate always starts locked.

func _ready():
	GameManager.all_items_collected.connect(_open_gate)

func _open_gate():
	for child in get_children():
		if child is CollisionShape3D:
			child.disabled = true
