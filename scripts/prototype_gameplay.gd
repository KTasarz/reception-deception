extends Node

@onready var label_money = $VBoxContainer/LabelMoney
@onready var label_guild_level = $VBoxContainer/LabelGuildLevel

var quest : Quest

@export var quest_in_scroll : PackedScene
@export var paper : PackedScene
@onready var map = $Map
@onready var quest_board_area = $QuestBoardArea
@onready var scroll_rest_area = $ScrollRestArea
@onready var work_space_area = $WorkSpaceArea

var current_draft_form : WritingQuest = null

func _ready() -> void:
	label_money.text = "Money: "+ str(GameStatsManager.money)
	label_guild_level.text = "Level: "+ str(GameStatsManager.guild_level)

func _on_button_exit_pressed() -> void:
	SceneManager.change_scene("res://scenes/prototype_menu.tscn")

func _on_new_quests_pressed() -> void:
	var npc : QuestsGivers = $QuestsGiverGenerator.generateQuestsGiver()
	quest = $QuestsGenerator.generate_quest(npc)
	quest.print_info()
	
	var new_paper = paper.instantiate() as WritingQuest
	work_space_area.add_child(new_paper)
	new_paper.open_map_requested.connect(_on_paper_requested_map)
	
	current_draft_form = new_paper

func _on_paper_requested_map(paper_instance : WritingQuest):
	# Mówimy mapie, która kartka o nią prosi
	map.open_for_paper(paper_instance)

func _on_accept_quests_pressed() -> void:
	if current_draft_form == null:
		print("The form paper doesnt exist!")
		return
	
	current_draft_form.update_quest_data(quest)
	
	var new_quest_scroll = quest_in_scroll.instantiate() as QuestInScroll
	work_space_area.add_child(new_quest_scroll)
	new_quest_scroll.quest = quest
	new_quest_scroll.quest_board = quest_board_area
	match new_quest_scroll.quest.giver.type:
		0:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/green scroll.png")
		1:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/black scroll.png")
		2:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/orange scroll.png")
		3:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/yellow scroll.png")
		4:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/white scroll.png")
		5:
			new_quest_scroll.texture = load("res://assets/sprites/scrolls/blue scroll.png")
	
	current_draft_form.queue_free()
	current_draft_form = null
