class_name Enemy_EvilRedCrystal
extends Enemy


func _init() -> void:
	texture = load("res://Sprites/Enemy_EvilRedCrystal.png")
	super._init()


func character_name():
	return "Evil Red Crystal"

func max_hp():
	return 300

func atk():
	return 30
