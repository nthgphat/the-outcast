extends TextureButton


func _on_pressed() -> void:
	Globals.play_sound("res://Music/button.mp3")
	$G_PanelOverlay.show()


func _on_inventory_panel_draw() -> void:
	var Player = Globals.get_node("Player")
	var ip = $G_PanelOverlay/inventory_panel
	ip.get_node("HP_value_text").text = str(Player.max_hp())
	ip.get_node("ATK_value_text").text = str(Player.atk())
	ip.get_node("LVL_value_text").text = str(Player.level)


func _on_inventory_panel_lvl_up_button_pressed() -> void:
	Globals.play_sound("res://Music/button.mp3")
	var Player = Globals.get_node("Player")
	if Player.current_xp >= 1000:
		Player.current_xp -= 1000
		Player.level += 1
		$G_PanelOverlay/inventory_panel.queue_redraw()
		get_tree().current_scene.queue_redraw()


func _on_inventory_panel_inventory_list_item_activated(index: int) -> void:
	Globals.play_sound("res://Music/button.mp3")
	var Player = Globals.get_node("Player")
	if index == 0:
		Player.is_sword_equipped = !Player.is_sword_equipped
	elif index == 1:
		Player.is_armor_equipped = !Player.is_armor_equipped
	
	$G_PanelOverlay/inventory_panel.queue_redraw()
