extends Panel


func _on_to_battle_button_pressed():
	var battlescreen = load("res://Code/BattleScreen.tscn").instantiate()
	var selected_level = $levels_list.get_selected_items()
	
	if selected_level.size() > 0:
		battlescreen.level = get_tree().current_scene.levels[selected_level[0]]
	
	get_tree().root.add_child(battlescreen)
	get_tree().current_scene = battlescreen
