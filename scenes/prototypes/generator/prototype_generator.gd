class_name PrototypeGenerator
extends View
## Generator Prototype creating stardust every Second


## Reference to the button that starts the generator
@export var button : Button
## Reference to the timer
@export var timer : Timer


## Initialize the label text.
func _ready() -> void:
	super()
	visible = true

## Creates stardust
func create_stardust () -> void:
	HandlerStardust.ref.create_stardust(1)


## starts the Stardust generator and diabling the button
func start_stardust_gen() -> void:
	timer.start()
	button.disabled = true

## Refrence to the Button being pressed
func _on_button_pressed() -> void:
	start_stardust_gen()

## self explaining
func _on_timer_timeout() -> void:
	create_stardust()
