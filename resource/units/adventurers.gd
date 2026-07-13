extends BasebattleUnit
class_name Adventurers

@export var class_type : AdventureClass
@export var days_of_contract : int
@export var adventure_rank : int

func evaluate_quest_appel(quest: Quest, intoxication: int, given_by_player: bool) -> float:
	var score : float = 0.0
	
	score += quest.player_set_reward * class_type.greed_multiplayer
	
	for tag in quest.tags:
		var bonus = class_type.tag_bonus.get(tag,0)
		var weight = class_type.tag_weight.get(tag, 1.0)
		score += bonus
		score *= weight
	
	#tu dać modyfikowanie score za pomocą różnic w poziomie
	
	if given_by_player:
		score *= UpgradableStatsManager.base_penalty_for_giving_quest+(float(intoxication)/100.0)
	
	return score
