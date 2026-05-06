extends Node
class_name QuestsGiversGenerator

func generateQuestsGiver() -> QuestsGivers:
	var npc = QuestsGivers.new()
	npc.type = randi_range(0,QuestsManager.quests_givers_type.size()-1)
	if randi_range(1,2) == 1:
		npc.is_male = true
	else:
		npc.is_male = false
	if npc.is_male:
		npc.name = str(NameManager.male_first_name.keys().pick_random())
	else:
		npc.name = str(NameManager.female_first_name.keys().pick_random())
	npc.surname = str(NameManager.last_name.keys().pick_random())
	#npc.sprite = "res://icon.svg"
	return npc
