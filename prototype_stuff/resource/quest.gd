extends Resource
class_name Quest

@export var money : float								#Ilość pięniedzy ile daje zleconiodawca
@export var true_level_difficulty : int					#Poziom trudności misji
@export var tags : Array[QuestsManager.quests_tags]		#Tagi misji
@export var target_location : QuestsManager.location	#Lokacja misji
