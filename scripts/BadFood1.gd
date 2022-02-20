extends Area2D

var sprite_badfood_width
signal badfood_collected

func _ready():
	sprite_badfood_width = $Sprite.texture.get_size().x * scale.x

func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_item_badfood")


func _on_BadFood1_body_entered(body):
	if body.is_in_group("Player"):
		$BadFood1.play()
		badfoodcollected()
		
func badfoodcollected():
	emit_signal("badfood_collected")
	Global.badfood_collected = true
	Global.badfoods += 1
	Global.slug += 3.3
	#Global.ADD_SPEED -= 10
	$Sprite.set_visible(false)

func _on_BadFood1_finished():
	queue_free()
