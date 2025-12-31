class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases Stardust created by clicker


## initialize the level on Load Data
func _init() -> void:
	level = Game.ref.data.up_01_level
	title = "Clicker Upgrade"
	base_cost = 5
	calculate_cost()

## Returns Description of upgrade
func description() -> String:
	@warning_ignore("shadowed_variable")
	var description : String = "Increses the amount of stardust created by the Clicker."
	description += "\nEffects: +1 Stardust on Click per Level"
	description += "\nCost : %s" %cost

	return description

## Calculate current cost based on level and base cost
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))

func purchase() -> void:
	pass

## Consumes Stardust to level up.
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost)

	if not error:
		level += 1
		Game.ref.data.up_01_level = level

		calculate_cost()

		leveled_up.emit()


## Returns wether you can Afford the upgrade
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost:
		return true

	else:
		return false
