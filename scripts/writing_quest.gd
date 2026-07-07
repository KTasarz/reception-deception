extends TextureRect
class_name WritingQuest

var is_dragging : bool = false
var drag_offset : Vector2 = Vector2.ZERO
@export var map : PackedScene

var location : QuestsManager.location

signal open_map_requested(paper_instance : WritingQuest)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Zaczynamy ciągnąć
			is_dragging = true
			# Obliczamy różnicę między pozycją myszki a lewym górnym rogiem kartki.
			# Dzięki temu kartka nie "przeskoczy" środkiem do kursora, tylko złapiemy ją tam, gdzie kliknęliśmy.
			drag_offset = get_global_mouse_position() - global_position
			
			# Ważne: Przenosi kartkę na sam wierzch interfejsu, żeby nie wsuwała się pod inne papiery!
			move_to_front() 
		else:
			# Puszczamy lewy przycisk myszy
			is_dragging = false

func _input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseMotion:
		# Aktualizujemy pozycję kartki z uwzględnieniem miejsca, za które ją złapaliśmy
		global_position = get_global_mouse_position() - drag_offset

func _on_location_pressed() -> void:
	open_map_requested.emit(self)

func set_location_text(location_name : String) -> void:
	var pre_format_text : String = "Location: {location}"
	var translated_location : String
	var location_key : String
	match location_name:
		"CAPITAL":
			location_key = WorldManager.current_locations_names[QuestsManager.location.CAPITAL_CITY]
			location = QuestsManager.location.CAPITAL_CITY
		"FOREST":
			location_key = WorldManager.current_locations_names[QuestsManager.location.FOREST]
			location = QuestsManager.location.FOREST
		"CAVE":
			location_key = WorldManager.current_locations_names[QuestsManager.location.CAVE]
			location = QuestsManager.location.CAVE
		"VALLEY":
			location_key = WorldManager.current_locations_names[QuestsManager.location.VALLEY]
			location = QuestsManager.location.VALLEY
		"RIVER":
			location_key = WorldManager.current_locations_names[QuestsManager.location.RIVER]
			location = QuestsManager.location.RIVER
		_:
			print("Something went wrong with getting a name of location!")
			return
	translated_location = tr(location_key)
	var format_text : String = pre_format_text.format({"location": translated_location})
	$VBoxContainer/HBoxContainer3/Location.text = format_text
	
func update_quest_data(quest_to_update: Quest) -> void:
	quest_to_update.quest_name = $VBoxContainer/QuestTitle.text
	quest_to_update.description = $VBoxContainer/QuestDescription.text
	quest_to_update.player_set_reward = float($VBoxContainer/Reward.value)
	quest_to_update.player_set_required_level = int($VBoxContainer/Level.value)
	quest_to_update.player_set_location = location
