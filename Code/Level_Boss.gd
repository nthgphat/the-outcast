extends Level
class_name Level_Boss


func _init():
	enemy = Enemy_Boss_Face.new()


func level_name() -> StringName:
	return "Boss"

func reward_xp() -> int:
	return 15000
