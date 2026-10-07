extends Sprite2D
class_name Character


func _init():
	hp = max_hp()


func action_do_nothing():
	pass

func action_basic_attack(target : Character):
	target.hp -= atk()
	target.modulate = Color(1, 0.25, 0.25, 1)
	Globals.play_sound("res://Music/attack.mp3")


func character_name() -> StringName:
	return "unknown_character"

func max_hp():
	return 1

func atk():
	return 0


var hp := 1
