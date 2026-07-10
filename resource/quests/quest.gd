extends Resource
class_name Quest

@export var quest_name : String
@export var description : String = ""
@export var giver : QuestsGivers
@export var money : float								#Ilość pięniedzy ile daje zleconiodawca
@export var true_level_difficulty : int					#Poziom trudności misji
@export var tags : Array[QuestsManager.quests_tags]		#Tagi misji
@export var location_chances : Dictionary[QuestsManager.location,float] = {}	#Lokacje misji

@export var is_location_hidden : bool
@export var player_set_location : QuestsManager.location
@export var player_set_reward : float
@export var player_set_required_level : int

func print_info() -> void:
	var locations : String = ""
	for i in location_chances:
		locations = locations + str(QuestsManager.location.keys()[i]) + " "
	var tags_string : String = ""
	for i in tags:
		tags_string = tags_string + str(QuestsManager.quests_tags.keys()[i]) + " "
	print(
		"NPC NAME: "+ giver.name + " " + giver.surname +"\n"+
		"NPC TYPE: "+ QuestsManager.quests_givers_type.keys()[giver.type] +"\n"+
		"QUEST NAME: " + quest_name +"\n"+
		"QUEST MONEY: " +str(money) +"\n"+
		"QUEST LEVEL: " + str(true_level_difficulty) +"\n"+
		"QUEST LOCATIONS: " + locations +"\n"+
		"QUEST TAGS: " + tags_string +"\n"+
		"QUEST DESCRIPTION: " + description
	)
