extends Panel


func _on_return_to_map_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/WorldMapScreen.tscn")
