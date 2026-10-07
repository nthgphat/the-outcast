extends TextureRect


func _ready() -> void:
	$settings_button/G_PanelOverlay.color = Color(0, 0, 0, 0.75)


func _on_play_button_pressed() -> void:
	Globals.play_sound("res://Music/button.mp3")
	get_tree().change_scene_to_file("res://Code/WorldMapScreen.tscn")
