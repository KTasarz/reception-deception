extends Node
class_name QuestsGenerator

func generate_quest(npc : QuestsGivers) -> Quest:
	var quest = Quest.new()
	
	quest.true_level_difficulty = randi_range(GameStatsManager.guild_level-10,GameStatsManager.guild_level+5)
	if quest.true_level_difficulty < 1:
		quest.true_level_difficulty = 1
	
	quest.money = randi_range(quest.true_level_difficulty*10,quest.true_level_difficulty*100)
	match npc.type:
		0:
			quest.money = quest.money * randf_range(0.05,0.35)
		1:
			quest.money = quest.money * randf_range(0.2,0.8)
		2:
			quest.money = quest.money * randf_range(0.8,1.0)
		3:
			quest.money = quest.money * randf_range(0.75,1.5)
		4:
			quest.money = quest.money * randf_range(1.0,1.5)
		5:
			quest.money = quest.money * randf_range(1.0,5.0)
	
	#tags
	
	#location
	
	return quest
