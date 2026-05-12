extends Node

@onready var label_money = $VBoxContainer/LabelMoney
@onready var label_guild_level = $VBoxContainer/LabelGuildLevel

var quest : Quest

@export var quest_paper_scene : PackedScene 
@onready var quest_board_area = $QuestBoardArea
@onready var scroll_rest_area = $ScrollRestArea
@onready var work_space_area = $WorkSpaceArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_money.text = "Money: "+ str(GameStatsManager.money)
	label_guild_level.text = "Level: "+ str(GameStatsManager.guild_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_exit_pressed() -> void:
	SceneManager.change_scene("res://scenes/prototype_menu.tscn")


func _on_new_quests_pressed() -> void:
	var npc : QuestsGivers = $QuestsGiverGenerator.generateQuestsGiver()
	quest = $QuestsGenerator.generate_quest(npc)
	quest.print_info()


func _on_accept_quests_pressed() -> void:
	var new_quest_scroll = quest_paper_scene.instantiate() as QuestInScroll
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
