extends Area2D

var sprite_food_width
signal food_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_food_width = $Sprite.texture.get_size().x * scale.x



func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_item_food")
	

func _on_Bread_body_entered(body):
	if body.is_in_group("Player"):
		$GoodFoodSound.play()
		collected2()
		
func collected2():
	emit_signal("food_collected")
	Global.food_collected = true
	Global.foods += 1
	#Global.ADD_SPEED -= 5
	$Sprite.set_visible(false)

func _on_GoodFoodSound_finished():
	queue_free()
