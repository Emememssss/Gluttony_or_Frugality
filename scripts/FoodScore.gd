extends Label

func _process(delta):
	text = "Total Healthy Foods Ate: "+String(Global.foods)



func _on_yes_button_pressed():
	get_tree().change_scene("res://scenes/game.tscn")


func _on_no_button_pressed():
	get_tree().change_scene("res://scenes/User Interface/Menu.tscn")
