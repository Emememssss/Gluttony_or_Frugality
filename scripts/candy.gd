extends Area2D

var sprite_candy_width
signal candy_collected

func _ready():
	sprite_candy_width = $Sprite.texture.get_size().x * scale.x

func _on_candy_body_entered(body):
	if body.is_in_group("Player"):
		collected()


func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_candy")

func collected():
	emit_signal("candy_collected")
	Global.candy_collected = true
	Global.candy += 1
	#Global.ADD_SPEED += 500
	#Global.ADD_JUMP += 500
	queue_free()
	

