extends TextureRect


@onready var player = Globals.get_node("Player")

var level : Level
var is_player_turn := true


func _on_battle_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Code/WorldMapScreen.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$G_PanelOverlay_win_panel.click_to_escape = false
	$G_PanelOverlay_lose_panel.click_to_escape = false
	$Player.texture = player.texture
	$enemy_atk_button.texture_normal = level.enemy.texture
	player.start_battle(level.enemy)
	texture = level.texture
	$battle_level_name.text = level.level_name()
	$enemy_name.text = level.enemy.character_name()
	print(level.enemy.texture == null)


func _draw() -> void:
	$player_hp.text = str(Globals.get_node("Player").hp) + "/" + str(Globals.get_node("Player").max_hp())
	$enemy_hp.text = str(level.enemy.hp) + "/" + str(level.enemy.max_hp())


func process_battle_turn(player_action):
	player.perform_action(player_action)
	$Player.modulate = player.modulate
	$enemy_atk_button.modulate = level.enemy.modulate
	queue_redraw()
	if level.enemy.hp <= 0:
		$G_PanelOverlay_win_panel/win_panel/label_reward_xp.text = "Earned " + str(level.reward_xp()) + " xp!"
		$G_PanelOverlay_win_panel.show()
		return
		
	await get_tree().create_timer(0.5).timeout
	player.modulate = Color(1, 1, 1, 1)
	level.enemy.modulate = Color(1, 1, 1, 1)
	$Player.modulate = Color(1, 1, 1, 1)
	$enemy_atk_button.modulate = Color(1, 1, 1, 1)
	is_player_turn = false
	
	level.enemy.determine_action()
	$Player.modulate = player.modulate
	$enemy_atk_button.modulate = level.enemy.modulate
	queue_redraw()
	if player.hp <= 0:
		$G_PanelOverlay_lose_panel.show()
		return
	
	await get_tree().create_timer(0.5).timeout
	is_player_turn = true
	player.modulate = Color(1, 1, 1, 1)
	level.enemy.modulate = Color(1, 1, 1, 1)
	$Player.modulate = Color(1, 1, 1, 1)
	$enemy_atk_button.modulate = Color(1, 1, 1, 1)
	queue_redraw()
