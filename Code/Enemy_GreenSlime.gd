class_name Enemy_GreenSlime
extends Enemy


func _init() -> void:
	texture = load("res://Sprites/Enemy_GreenSlime.png")
	super._init()
	

func character_name():
	return "Green Slime"

func max_hp():
	return 50

func atk():
	return 10
