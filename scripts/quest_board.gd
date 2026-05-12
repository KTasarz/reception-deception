extends Control
class_name QuestBoard

var active_quests : Array[Quest] = []

func pin_quest(quest: Quest) -> void:
	active_quests.append(quest)
	update_board_visuals()

func update_board_visuals() -> void:
	$CenterContainer/LabelQuestBoardCounter.text = str(active_quests.size())
