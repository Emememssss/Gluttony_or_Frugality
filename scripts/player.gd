extends KinematicBody2D

const SPEED = 250
const JUMPFORCE = 1000
const GRAVITY = 50

var velocity = Vector2(0, 0)

onready var jump_sound = $jumpsound
onready var animation = $AnimatedSprite

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		if is_on_floor():
			animation.play("walk")
			animation.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		if is_on_floor():
			animation.play("walk")
			animation.flip_h = true
	else:
		if is_on_floor():
			animation.play("idle")
	
	if is_on_floor():
		velocity.y=0
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= JUMPFORCE
		jump_sound.play()
		animation.play("jump")
		
	velocity.y += GRAVITY
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().reload_current_scene()
