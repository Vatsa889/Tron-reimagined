class_name Game
extends Node
## Main node of the Game

## Singleton Refrence
static var ref : Game

## Singleton check
func _singleton_check() -> void:
	if not ref:
		ref = self
		return

	queue_free()

## Contains the Data to save and load
var data : Data

## Singleton check & data initialization
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()

	SaveSystem.load_data()

func _ready() -> void:
	var save_timer : Timer = Timer.new()
	save_timer.autostart = true
	save_timer.wait_time = 60.0
	save_timer.timeout.connect(SaveSystem.save_data)
	add_child(save_timer)
