extends Character
class_name Player


func action_healhalf():
	hp = min(hp + max_hp() / 2, max_hp())
	self.modulate = Color(0.25, 1, 0.25, 1)


var level := 0
var current_xp = 5000
var is_sword_equipped = false
var is_armor_equipped = false


var actions = {
	"Do nothing" : {
		"method" : Callable(self, "action_do_nothing"),
		"description" : "Do nothing"
	},
	"Basic attack" : {
		"method" : Callable(self, "action_basic_attack"),
		"description" : "Deal 100% ATK to enemy"
	},
	"Heal 50%" : {
		"method" : Callable(self, "action_healhalf"),
		"description" : "Heal 50% of your max HP",
		"cooldown" : 3,
		"current_cooldown" : 0
	}
}


func max_hp() -> int:
	return 100 * (1 + 0.2 * level) + (int(is_armor_equipped) * 25)

func atk() -> int:
	return 10 * (1 + 0.2 * level) + (int(is_sword_equipped) * 10)


func start_battle(enemy):
	hp = max_hp()
	actions["Basic attack"]["method"] = actions["Basic attack"]["method"].bind(enemy)
	

# ret "" for success, not "" for failure
func perform_action(action_name):
	var action = actions[action_name]
	var has_cooldown = action.has("cooldown")
	if !has_cooldown:
		action["method"].call()
		for key in actions:
			if actions[key].has("cooldown") && actions[key]["current_cooldown"] > 0:
				actions[key]["current_cooldown"] -= 1
	
	elif has_cooldown && action["current_cooldown"] == 0:
		action["method"].call()
		action["current_cooldown"] = action["cooldown"]
