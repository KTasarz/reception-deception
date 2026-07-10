extends Node

var money_ranges := {
	QuestsManager.quests_givers_type.peasant:{
		"min": 0.05,
		"max": 0.35
	},
	QuestsManager.quests_givers_type.burgher:{
		"min": 0.2,
		"max": 0.8
	},
	QuestsManager.quests_givers_type.guard:{
		"min": 0.8,
		"max": 1.0
	},
	QuestsManager.quests_givers_type.merchant:{
		"min": 0.75,
		"max": 1.5
	},
	QuestsManager.quests_givers_type.cleric:{
		"min": 1.0,
		"max": 1.5
	},
	QuestsManager.quests_givers_type.noble:{
		"min": 1.0,
		"max": 5.0
	},
}
var base_penalty_for_giving_quest: float = 0.75

func get_random_money(npc_type: QuestsManager.quests_givers_type) -> float:
	var scope = money_ranges[npc_type]
	return randf_range(scope.min,scope.max)

func modify_money_range(npc_type: QuestsManager.quests_givers_type, min_bonus: float,max_bonus: float) -> void:
	money_ranges[npc_type].min += min_bonus
	money_ranges[npc_type].max += max_bonus
