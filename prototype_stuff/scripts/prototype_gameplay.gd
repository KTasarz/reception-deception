extends Node

@onready var label_money = $VBoxContainer/LabelMoney
@onready var label_guild_level = $VBoxContainer/LabelGuildLevel
@onready var label_quests_info = $VBoxContainer2/QuestsInfo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_money.text = "Money: "+ str(GameStatsManager.money)
	label_guild_level.text = "Level: "+ str(GameStatsManager.guild_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_exit_pressed() -> void:
	SceneManager.change_scene("res://prototype_stuff/scenes/prototype_menu.tscn")


func _on_new_quests_pressed() -> void:
	var npc : QuestsGivers = $QuestsGiverGenerator.generateQuestsGiver()
	var quest : Quest = $QuestsGenerator.generate_quest(npc)
	label_quests_info.text = (
		"NPC NAME: "+ npc.name + " " + npc.surname +"\n"+
		"NPC TYPE: "+ QuestsManager.quests_givers_type.keys()[npc.type] +"\n"+
		"QUEST NAME: " + quest.quest_name +"\n"+
		"QUEST MONEY: " +str(quest.money)
	)
