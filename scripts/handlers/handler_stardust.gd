class_name HandlerStardust
extends Node
## Manages Stardust and related signals.


## Singleton Refrence
static var ref : HandlerStardust

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return

	queue_free()

## Emmited on stardust creation
signal stardust_created(quantity : int)
## Emmited on stardust consumption
signal stardust_consumed(quantity : int)

## returns the current amount of stardust
func stardust() -> int:
	return Game.ref.data.stardust


## Creates a specific amount of stardust
func create_stardust (quantity : int) -> void:
	Game.ref.data.stardust += quantity
	stardust_created.emit(quantity)


## Consumes  a specific amount of stardust
func consume_stardust (quantity : int) -> Error:
	if quantity > Game.ref.data.stardust:
		return FAILED

	Game.ref.data.stardust -= quantity
	stardust_consumed.emit(quantity)

	return OK

## creates stardust when triggered by the clicker
func trigger_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level

	create_stardust(quantity)
