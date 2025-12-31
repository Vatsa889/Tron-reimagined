class_name View
extends Control
## Abstract class defining a view

## Reference to the UI
@export var user_interface : UserInterface
## Reference to the UI view
@export var view : UserInterface.Views

## On initialisation connects to signal
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigationrequest)
	visible = false

## react to Navigation request
func _on_navigationrequest(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
