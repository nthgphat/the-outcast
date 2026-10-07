extends Level
class_name Level_Level1


func _init():
	enemy = Enemy_GreenSlime.new()


func level_name() -> StringName:
	return "Level 1"

func reward_xp() -> int:
	return 1000
