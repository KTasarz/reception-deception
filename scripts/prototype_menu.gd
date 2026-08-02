extends Node


func _on_button_gameplay_pressed() -> void:
	SceneManager.change_scene("res://scenes/prototype_gameplay.tscn")


func _on_buttongraphics_pressed() -> void:
	SceneManager.change_scene("res://scenes/prototype_graphics.tscn")


func _on_button_exit_pressed() -> void:
	get_tree().quit()


func _on_button_test_tiles_pressed() -> void:
	SceneManager.change_scene("res://scenes/test_tiles.tscn")
