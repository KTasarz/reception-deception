extends Resource
class_name QuestTemplate

@export var name : String
@export var description_templates : Array[String]

@export var tags : Array[QuestsManager.quests_tags]
@export var allowed_givers : Array[QuestsManager.quests_givers_type]
