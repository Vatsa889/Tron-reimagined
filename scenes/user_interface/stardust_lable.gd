class_name LabelStardust
extends Label
## Displays the current amount of Stardust Available

## Connects to Signal on startup
func _ready() -> void:
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

## Temporary function for updating the lable text
func update_text (_quantity : int = -1) -> void:
	text = "Stardust : %s" %HandlerStardust.ref.stardust()
