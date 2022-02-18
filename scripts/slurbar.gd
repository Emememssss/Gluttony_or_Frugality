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
	var valu = Global.foods + Global.foods
	get_node("sb").set_value(valu)
	if valu > 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.red)
		
	elif valu > 30 and valu <= 60:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.orange)
		
	elif valu <= 30:
		var stylsbox = .get_node("sb").get("custom_styles/fg")
		stylsbox.set_bg_color(Color.green)
