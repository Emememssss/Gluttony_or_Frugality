extends Control

var Weight = 0

func _ready():
	var wb = ProgressBar.new()
	wb.set_percent_visible(70)
	wb.set_value(100)
	wb.set_size(Vector2(150,30))
	wb.set_position(Vector2(40,70))
	var style = StyleBoxFlat.new()
	style.set_bg_color(Color.yellow)
	wb.set("custom_styles/fg" , style)
	wb.set_name("weightbar")
	.add_child(wb) 
	var stylebox = .get_node("weightbar").get("custom_styles/fg")

	
func _process(_delta):
	Weight()
	var valu = get_node("weightbar").get_value()
	if valu <= 20:
		var stylebox = .get_node("weightbar").get("custom_styles/fg")
		stylebox.set_bg_color(Color.yellowgreen)
		
	elif valu > 20 and valu <= 40:
		var stylebox = .get_node("weightbar").get("custom_styles/fg")
		stylebox.set_bg_color(Color.yellow)
		
	elif valu > 40 and valu <= 60:
		var stylebox = .get_node("weightbar").get("custom_styles/fg")
		stylebox.set_bg_color(Color.orange)
		
	elif valu > 60 and valu <= 80:
		var stylebox = .get_node("weightbar").get("custom_styles/fg")
		stylebox.set_bg_color(Color.orangered)
		
	elif valu <= 30:
		var stylebox = .get_node("weightbar").get("custom_styles/fg")
		stylebox.set_bg_color(Color.red)


func Weight():
	var valu

	if Weight >= 100:
		Weight = 100
		get_node("weightbar").set_value(Weight)
		
	elif Weight < 100:
		get_node("weightbar").set_value(Global.ADD_SPEED/10)
	

	
