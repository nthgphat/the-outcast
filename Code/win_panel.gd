extends Panel


@onready var player = Globals.get_node("Player")


func _on_return_to_map_button_pressed() -> void:
	player.current_xp += get_tree().current_scene.level.reward_xp()
	get_tree().change_scene_to_file("res://Code/WorldMapScreen.tscn")
