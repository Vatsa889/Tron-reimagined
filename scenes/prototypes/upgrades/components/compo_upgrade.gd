class_name CompoUpgrade
extends Control
## Component displaying an upgrade.

## Refrence to the title label
@export var label_title : Label
## Refrence to the richtext label desription
@export var label_description : RichTextLabel
## Refrence to the purchase button
@export var button : Button

## Upgrade to be displayed
var upgrade : Upgrade

func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()

	update_label_title()
	update_lable_description()
	update_button()


	HandlerStardust.ref.stardust_created.connect(update_button)
	HandlerStardust.ref.stardust_consumed.connect(update_button)

	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_lable_description)
	upgrade.leveled_up.connect(update_button)



##updates the title of the upgrade
func update_label_title() -> void:
	var text : String = upgrade.title + "(%s)" %upgrade.level
	label_title.text = text

## updates the upgrade description
func update_lable_description() -> void:
	label_description.text = upgrade.description()

## updates the button availability
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	button.disabled = true

## Triggers level when purchase button is pressed
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
