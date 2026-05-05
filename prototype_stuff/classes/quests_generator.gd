extends Node
class_name QuestsGenerator

@export var all_quest_templates : Array[QuestTemplate]

func generate_quest(npc : QuestsGivers) -> Quest:
	var quest = Quest.new()
	
	var valid_templates : Array[QuestTemplate] = []
	for template in all_quest_templates:
		if npc.type in template.allowed_givers:
			valid_templates.append(template)
	
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
	
	var chosen_template : QuestTemplate = valid_templates.pick_random()
	quest.quest_name = chosen_template.name
	quest.tags = chosen_template.tags.duplicate()
	quest.location_chances = chosen_template.location_chances.duplicate() 
		
		# Losujemy jeden z opisów
	if chosen_template.description_templates.size() > 0:
		var raw_desc = chosen_template.description_templates.pick_random()
			# Fajna sztuczka: dynamiczna podmiana tekstu w opisie!
		raw_desc = raw_desc.replace("{NAME}", npc.name)
		quest.description = raw_desc
	
	return quest
