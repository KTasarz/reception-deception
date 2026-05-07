extends Control

var is_dragging : bool = false
var drag_offset : Vector2 = Vector2.ZERO

func _on_button_exit_pressed() -> void:
	SceneManager.change_scene("res://scenes/prototype_menu.tscn")

func _on_wine_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Zaczynamy ciągnąć
			is_dragging = true
			# Obliczamy różnicę między pozycją myszki a lewym górnym rogiem kartki.
			# Dzięki temu kartka nie "przeskoczy" środkiem do kursora, tylko złapiemy ją tam, gdzie kliknęliśmy.
			drag_offset = get_global_mouse_position() - $Wine.position
			
			# Ważne: Przenosi kartkę na sam wierzch interfejsu, żeby nie wsuwała się pod inne papiery!
			move_to_front() 
		else:
			# Puszczamy lewy przycisk myszy
			is_dragging = false

func _input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseMotion:
		# Aktualizujemy pozycję kartki z uwzględnieniem miejsca, za które ją złapaliśmy
		$Wine.position = get_global_mouse_position() - drag_offset
