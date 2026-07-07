extends Node

const CAPITAL_NAMES_POOL = ["LOC_CAPITAL_01"]
const FOREST_NAMES_POOL = ["LOC_FOREST_01", "LOC_FOREST_02","LOC_FOREST_03"]
const CAVE_NAMES_POOL = ["LOC_CAVE_01"]
const VALLEY_NAMES_POOL = ["LOC_VALLEY_01"]
const RIVER_NAMES_POOL = ["LOC_RIVER_01"]

var current_locations_names : Dictionary = {}

func generate_new_world_names_locations() -> void:
	current_locations_names.clear()
	  
	current_locations_names[QuestsManager.location.CAPITAL_CITY] = CAPITAL_NAMES_POOL.pick_random()
	current_locations_names[QuestsManager.location.FOREST] = FOREST_NAMES_POOL.pick_random()
	current_locations_names[QuestsManager.location.CAVE] = CAVE_NAMES_POOL.pick_random()
	current_locations_names[QuestsManager.location.VALLEY] = VALLEY_NAMES_POOL.pick_random()
	current_locations_names[QuestsManager.location.RIVER] = RIVER_NAMES_POOL.pick_random()
	
	print("New location names selected")
