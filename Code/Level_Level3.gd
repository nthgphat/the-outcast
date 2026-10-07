extends Level
class_name Level_Level3


func _init():
	enemy = Enemy_EvilRedCrystal.new()


func level_name() -> StringName:
	return "Level 3"

func reward_xp() -> int:
	return 7500
