class_name SaveSystem
extends Node

const SAVE_PATH : String = "user://save.tres"

## Saves the game data
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, SAVE_PATH)
	print("Game Saved")

## Loads the game data
static func load_data() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var data = SafeResourceLoader.load(SAVE_PATH)

	if data:
		Game.ref.data = data
		print("Game Loaded")
	else:
		print("Failed to load save file")
