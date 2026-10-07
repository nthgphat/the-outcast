extends TextureButton


@onready var action_list = $G_PanelOverlay/player_actions_panel/action_list
@onready var player = Globals.get_node("Player")


func _ready():
	action_list.clear()
	
	for key in player.actions:
		action_list.add_item(key)

	update_actions_list_cooldown()


func _on_pressed() -> void:
	if get_tree().current_scene.is_player_turn == true:
		$G_PanelOverlay.show()


func _on_action_list_item_selected(index: int) -> void:
	$G_PanelOverlay.hide()
	action_list.deselect(index)
	get_tree().current_scene.process_battle_turn(action_list.get_item_text(index))
	update_actions_list_cooldown()


# disable actions currenly on cooldown
func update_actions_list_cooldown():
	for index in range(action_list.item_count):
		var action = player.actions[action_list.get_item_text(index)]
		var tooltip_str = action.description
		if action.has("cooldown"):
			tooltip_str += ".\nCooldown " + str(action["cooldown"]) + " (" + str(action["current_cooldown"]) + " turns remaining)"
			
			if action["current_cooldown"] > 0:
				action_list.set_item_selectable(index, false)
			else:
				action_list.set_item_selectable(index, true)
				
		action_list.set_item_tooltip(index, tooltip_str)
