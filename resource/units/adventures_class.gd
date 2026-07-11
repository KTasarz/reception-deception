extends Resource
class_name AdventureClass

enum juice_type {MANA, ENERGY}

@export var name : String
@export var greed_multiplayer : float = 1.0
@export var tag_weight : Dictionary[String,float] = {}
@export var tag_bonus: Dictionary[String, int] = {}
@export var juice : juice_type
