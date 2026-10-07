extends Character
class_name Enemy


func _init():
	super._init()


func determine_action():
	action_basic_attack(Globals.get_node("Player"))
