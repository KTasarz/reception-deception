extends Node
class_name QuestsGenerator

var all_quest_templates : Array[QuestTemplate] = []

func _ready():
	# Przy starcie gry wywołujemy naszą funkcję ładującą
	load_templates_from_folder("res://assets/templates/quests/")

func load_templates_from_folder(path: String):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			# Pomijamy foldery i upewniamy się, że to plik zasobu
			# Uwaga: używamy trim_suffix(".remap"), bo po wyeksportowaniu gry 
			# Godot może dopisać tę końcówkę do plików .tres!
			var clean_name = file_name.trim_suffix(".remap")
			
			if not dir.current_is_dir() and clean_name.ends_with(".tres"):
				# Tworzymy pełną ścieżkę do pliku
				var full_path = path + "/" + file_name
				# Ładujemy plik z dysku i rzutujemy na naszą klasę
				var loaded_template = load(full_path) as QuestTemplate
				
				if loaded_template:
					all_quest_templates.append(loaded_template)
					
			# Przechodzimy do kolejnego pliku w folderze
			file_name = dir.get_next()
			
		print("Pomyślnie wczytano ", all_quest_templates.size(), " szablonów questów.")
	else:
		push_error("Błąd: Nie można otworzyć folderu z questami pod ścieżką: ", path)

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
	quest.money = quest.money * GameStatsManager.get_random_money(npc.type)
	
	var chosen_template : QuestTemplate = valid_templates.pick_random()
	quest.quest_name = chosen_template.name
	quest.tags = chosen_template.tags.duplicate()
	quest.location_chances = chosen_template.location_chances.duplicate() 
	quest.description = chosen_template.description
	quest.giver = npc
	
	return quest
