extends Resource
class_name QuestTemplate

@export var name : String
@export var description : String
@export var is_location_hidden : bool
@export var location_chances : Dictionary[QuestsManager.location,float] = {QuestsManager.location.town:1.0}
@export var tags : Array[QuestsManager.quests_tags]
@export var allowed_givers : Array[QuestsManager.quests_givers_type]
