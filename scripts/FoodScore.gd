extends Label

func _process(delta):
	text = "Total Healthy Foods Ate: "+String(Global.foods)



func _on_yes_button_pressed():
	get_tree().change_scene("res://scenes/game.tscn")
	Global.ADD_SPEED=0
	Global.foods = 0
	Global.badfoods = 0
	Global.progress_score = 0


func _on_no_button_pressed():
	get_tree().change_scene("res://scenes/User Interface/Menu.tscn")
