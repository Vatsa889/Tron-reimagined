class_name UserInterface
extends Control
## Main class controling the UI

## Initializazion for all possible views
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
}

## Emitted when something requested Navigation
signal navigation_requested(view : Views)

## Sets Starting View to generator
func _ready() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)


## Trigerred whe PrototypeGeneratorLink is Clicked
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Trigerred whe PrototypeClickerLink is Clicked
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

## Trigerred whe PrototypeUpgradesLink is Clicked
func _on_prototype_upgrades_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)
