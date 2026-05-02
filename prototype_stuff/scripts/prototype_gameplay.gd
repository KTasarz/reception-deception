extends Node

@onready var label_money = $VBoxContainer/LabelMoney
@onready var label_guild_level = $VBoxContainer/LabelGuildLevel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_money.text = "Money: "+ str(GameStatsManager.money)
	label_guild_level.text = "Level: "+ str(GameStatsManager.guild_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_exit_pressed() -> void:
	SceneManager.change_scene("res://prototype_stuff/scenes/prototype_menu.tscn")
