extends Area3D

# ---------- VARIABLES ---------- #

@export_file("*.tscn") var next_scene_path: String = ""

# ---------- SIGNALS ---------- #

func _on_body_entered(body):
	if not body.is_in_group("Player"):
		return

	# Only let the player pass once every item in the level has been collected
	if GameManager.items_collected >= GameManager.items_required and next_scene_path != "":
		get_tree().change_scene_to_file(next_scene_path)
