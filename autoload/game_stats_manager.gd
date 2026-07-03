extends Node

var money : float = 0
var guild_level : int = 1
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

func get_random_money(npc_type: QuestsManager.quests_givers_type) -> float:
	var range = money_ranges[npc_type]
	return randf_range(range.min,range.max)

func modify_money_range(npc_type: QuestsManager.quests_givers_type, min_bonus: float,max_bonus: float) -> void:
	money_ranges[npc_type].min += min_bonus
	money_ranges[npc_type].max += max_bonus

func reset_money():
	money = 0

func reset_guild_level():
	guild_level = 1

func reset_everything():
	reset_money()
	reset_guild_level()
