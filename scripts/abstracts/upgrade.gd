class_name Upgrade
extends Node
## Abstract class to define upgrades

## Emmitted when leveled up
signal leveled_up

##level of upgrades
var level : int = -1
## Basecost of the upgrade
var base_cost : int = -1
## Upgrade title
var title :  String = "Title not Defined."
## Current upgrade cost
var cost : int = -1


## Virtiual class, must be overwitten.[br]
## Returns description of the upgrade
func description() -> String:

	return "Description not defined."

## Virtiual class, must be overwitten.[br]
## Returns current cost based on level and base cost
func calculate_cost() -> void:
	printerr("Claculate_cost() method not defined.")

## Virtiual class, must be overwitten.[br]
## Returns wether you can afford the upgrade
func can_afford() -> bool:
	return false

## Virtiual class, must be overwitten.[br]
## Consumes Stardust to level up.
func level_up() -> void:
	printerr("Level_up method not defined.")
