extends TextureRect


var levels = [
	preload("res://Code/Level_Level1.tscn").instantiate(),
	preload("res://Code/Level_Level2.tscn").instantiate(),
	preload("res://Code/Level_Level3.tscn").instantiate(),
	preload("res://Code/Level_Boss.tscn").instantiate()
]


func _ready():
	$settings_button/G_PanelOverlay.color = Color(0, 0, 0, 0.75)
	$inventory_button/G_PanelOverlay.color = Color(0, 0, 0, 0.75)
	for level in levels:
		$levels_panel/levels_list.add_item(level.level_name())
		
	$levels_panel/levels_list.select(0)


func _on_draw() -> void:
	$xp_amount.text = str(Globals.get_node("Player").current_xp)
