extends Resource
#KOD PONIŻEJ JEST WYSRANY PRZEZ AI
#JEST NIE SPRAWDZONY
#ZOSTAWIŁEM GO TAK BO MUSIAŁEM IŚĆ NA OBCHÓD XD
class_name QuestTemplate

@export var name : String
@export var description_templates : Array[String]

@export var required_tags : Array[QuestsGivers.quests_tags]
@export var allowed_givers : Array[QuestsGivers.quests_givers_type]
