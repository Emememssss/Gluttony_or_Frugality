extends Node2D

var Energy = 100
onready var timer = get_node("Timer")

func _ready():
	var eb = ProgressBar.new()
	eb.set_percent_visible(70)
	eb.set_value(100)
	eb.set_size(Vector2(130,25))
	eb.set_position(Vector2(30,67))
	var style = StyleBoxFlat.new()
	style.set_bg_color(Color.yellow)
	eb.set("custom_styles/fg" , style)
	eb.set_name("eb")
	.add_child(eb) 
	var stylebox = .get_node("eb").get("custom_styles/fg")
	timer.set_wait_time(0.5)
	timer.start()
	
	
func _process(_delta):
	var valu = get_node("eb").get_value()
	if valu > 60:
		var stylebox = .get_node("eb").get("custom_styles/fg")
		stylebox.set_bg_color(Color.green)
		
	elif valu > 30 and valu <= 60:
		var stylebox = .get_node("eb").get("custom_styles/fg")
		stylebox.set_bg_color(Color.orange)
		
	elif valu <= 30 and valu>0:
		var stylebox = .get_node("eb").get("custom_styles/fg")
		stylebox.set_bg_color(Color.red)
		
	elif valu == 0:
		get_tree().change_scene("res://scenes/User Interface/Death_Screen.tscn")


func _on_Timer_timeout():
	var valu
	Energy -= 1
	
	if Energy >= 100:
		Energy = 100
		get_node("eb").set_value(Energy)
		
	elif Energy < 100:
		get_node("eb").set_value(Energy + int(Global.foods) - int(Global.badfoods))
		
	elif Energy <= 0:
		get_tree().change_scene("res://scenes/User Interface/Death_Screen.tscn")
	

	
