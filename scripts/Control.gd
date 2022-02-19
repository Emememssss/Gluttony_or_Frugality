extends Control

func _ready():
	$ctrlsinterfacebackbutton.grab_focus()

func _on_ctrlsinterfacebackbutton_pressed():
	get_tree().change_scene("res://scenes/User Interface/Menu.tscn")
