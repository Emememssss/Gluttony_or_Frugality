extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/startbutton.grab_focus()



func _on_startbutton_pressed():
	get_tree().change_scene("res://scenes/game.tscn")


func _on_quitbutton_pressed():
	get_tree().quit()


func _on_ctrlmenubutton_pressed():
	get_tree().change_scene("res://scenes/User Interface/Control.tscn")


func _on_howtogame_pressed():
	get_tree().change_scene("res://scenes/User Interface/howtos.tscn")
	
	
func _on_bgvid_finished():
	$bgvid.play()


