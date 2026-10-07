extends TextureButton


func _on_pressed():
	Globals.play_sound("res://Music/button.mp3")
	$G_PanelOverlay.show()


func _on_quit_to_title_screen_button_pressed():
	Globals.play_sound("res://Music/button.mp3")
	get_tree().change_scene_to_file("res://Code/TitleScreen.tscn")
