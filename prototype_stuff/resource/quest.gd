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
@export var player_set_guild_cut : float
@export var player_set_required_level : int
