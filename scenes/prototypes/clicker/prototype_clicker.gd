class_name PrototypeClicker
extends View
## A clicker Prototype creating Stardust



## Initialize the label on launch
func _ready() -> void:
	super()


## Adds Stardust
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)


## Triggered when create stardust Button is pressed
func _on_button_pressed() -> void:
	HandlerStardust.ref.trigger_clicker()
