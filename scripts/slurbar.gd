extends Node2D

var Slur = 100
onready var timer = get_node("Timer")

func _ready():
	var sb = ProgressBar.new()
	sb.set_percent_visible(70)
	sb.set_value(0)
	sb.set_size(Vector2(130,25))
	sb.set_position(Vector2(95,138))
	var style = StyleBoxFlat.new()
	style.set_bg_color(Color.yellow)
	sb.set("custom_styles/fg" , style)
	sb.set_name("sb")
	.add_child(sb) 
	var stylsbox = .get_node("sb").get("custom_styles/fg")
	
func _process(_delta):
	#var valu = get_node("sb").get_value()
	var valu = float(Global.slug)
	
	
		
	
	get_node("sb").set_value(valu)
	if valu > 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.red)
		Global.ADD_SPEED = -200
		
	elif valu > 30 and valu <= 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.orange)
		Global.ADD_SPEED = -100
		
	elif valu <= 30 and valu > 0:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.green)
		Global.ADD_SPEED = -50
		
	elif valu <= 0:
		Global.ADD_SPEED = 0;
	
