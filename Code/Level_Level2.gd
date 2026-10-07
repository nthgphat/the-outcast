extends Level
class_name Level_Level2


func _init():
	enemy = Enemy_BlockHead.new()


func level_name() -> StringName:
	return "Level 2"

func reward_xp() -> int:
	return 3000
