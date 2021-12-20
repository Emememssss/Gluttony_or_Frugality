extends KinematicBody2D

var sprite_width

func _ready():
	sprite_width = $Sprite.texture.get_size().x *scale.x



func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_higherground")
