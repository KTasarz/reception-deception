extends BasebattleUnit
class_name Adventurers

@export var class_type : AdventureClass

func evaluate_quest_appel(quest: Quest, intoxication: int, given_by_player: bool) -> float:
	var score : float = 0.0
	
	score += quest.player_set_reward * class_type.greed_multiplayer
	
	for tag in quest.tags:
		var weight = class_type.tag_weight.get(tag, 1.0)
		score *= weight
	
	#tu dać modyfikowanie score za pomocą różnic w poziomie
	
	if given_by_player:
		score *= GameStatsManager.base_penalty_for_giving_quest+(float(intoxication)/100.0)
	
	return score
