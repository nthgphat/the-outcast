extends Panel
	

func _on_music_slider_value_changed(value: float) -> void:
	Globals.music_volume = value

func _on_sound_slider_value_changed(value: float) -> void:
	Globals.sound_volume = value


func _on_music_slider_draw() -> void:
	$music_slider.set_value(Globals.music_volume)
	
func _on_sound_slider_draw() -> void:
	$sound_slider.set_value(Globals.sound_volume)
