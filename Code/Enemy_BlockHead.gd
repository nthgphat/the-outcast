class_name Enemy_BlockHead
extends Enemy


func _init() -> void:
	texture = load("res://Sprites/Enemy_BlockHead.png")
	super._init()


func character_name():
	return "BlockHead"

func max_hp():
	return 150

func atk():
	return 15
