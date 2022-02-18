extends Node2D

var Slur = 100
onready var timer = get_node("Timer")

func _ready():
	var sb = ProgressBar.new()
	sb.set_percent_visible(70)
	sb.set_value(0)
	sb.set_size(Vector2(130,25))
	sb.set_position(Vector2(-100,100))
	var style = StyleBoxFlat.new()
	style.set_bg_color(Color.yellow)
	sb.set("custom_styles/fg" , style)
	sb.set_name("sb")
	.add_child(sb) 
	var stylsbox = .get_node("sb").get("custom_styles/fg")
	timer.set_wait_time(0.5)
	timer.start()
	
	
func _process(_delta):
	var valu = get_node("sb").get_value()
	if valu > 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.red)
		
	elif valu > 30 and valu <= 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.orange)
		
	elif valu <= 30:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.green)


func _on_Timer_timeout():
	var valu
	Slur -= 1
	
	if Slur >= 100:
		Slur = 100
		get_node("sb").set_value(Slur)
		
	elif Slur < 100:
		get_node("sb").set_value(Slur)
		
	#elif Slur <= 0:
	#	get_tree().change_scene("res://scenes/User Interface/Death_Screen.tscn")
	

	
