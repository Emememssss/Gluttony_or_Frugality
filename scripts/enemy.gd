extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var direction = -1
export var detects_cliffs = true
export var bounce = true
var sprite_enemy_width

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	sprite_enemy_width = $AnimatedSprite.get_sprite_frames().get_frame("squashed",0).get_size().x * scale.x
	

func _physics_process(delta):
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	

func _on_top_checker_body_entered(body):
	$AnimatedSprite.play("squashed")
	speed = 0
	set_collision_layer_bit(3,false)
	set_collision_mask_bit(0, false)
	set_collision_mask_bit(1, false)
	$top_checker.set_collision_layer_bit(3, false)
	$top_checker.set_collision_mask_bit(0, false)
	$sides_checker.set_collision_layer_bit(3, false)
	$sides_checker.set_collision_mask_bit(0, false)
	Global.bounce = true
	
func _on_sides_checker_body_entered(body):
	if is_on_floor():
		body.ouch(position.x)
	


func _on_VisibilityNotifier2D_screen_entered():
	Signals.emit_signal("create_new_enemy")
