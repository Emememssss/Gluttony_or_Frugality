extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_food_item")
