extends Control

func _ready():
	pass # Replace with function body.

func _on_ctrlsinterfacebackbutton_pressed():
	get_tree().change_scene("res://scenes/User Interface/Menu.tscn")
