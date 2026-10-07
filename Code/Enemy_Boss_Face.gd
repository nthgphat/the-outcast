class_name Enemy_Boss_Face
extends Enemy


var rng = RandomNumberGenerator.new()


func action_heal_quarter():
	hp = max(hp + 0.25 * max_hp(), max_hp())
	self.modulate = Color(0.25, 1, 0.25, 1)


func _init() -> void:
	rng.randomize()
	texture = load("res://Sprites/Enemy_Boss_Face.png")
	super._init()


func character_name():
	return "The Face"

func max_hp():
	return 2500

func atk():
	return 100
	
	
func determine_action():
	var rng_result = rng.randi_range(1, 4)
	if rng_result == 1 && hp < max_hp() / 2:
		action_heal_quarter()
	else:
		action_basic_attack(Globals.get_node("Player"))
