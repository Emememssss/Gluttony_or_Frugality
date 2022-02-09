extends KinematicBody2D

var ADD_SPEED = 0
var ADD_JUMP = 0
const SPEED = 250
const JUMPFORCE = 1300
const GRAVITY = 50 

var velocity = Vector2(0, 0)

onready var jump_sound = $jumpsound
onready var animation = $AnimatedSprite

func _physics_process(delta):
	ADD_SPEED = int(Global.ADD_SPEED)
	ADD_JUMP = int(Global.ADD_JUMP)
	if Input.is_action_pressed("ui_right"):
		Global.progress_score += 1
		if ADD_SPEED == 0:
			velocity.x = SPEED
		
		if ADD_SPEED != 0:
						velocity.x = SPEED+ADD_SPEED
		
		if is_on_floor():
			animation.play("walk")
			animation.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		Global.progress_score -= 1;
		if is_on_floor():
			animation.play("walk")
			animation.flip_h = true
	else:
		if is_on_floor():
			animation.play("idle")
	
	if is_on_floor():
		velocity.y=0

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= JUMPFORCE + ADD_JUMP
		jump_sound.play()
		animation.play("jump")
	
	velocity.y += GRAVITY 
		
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	if Global.bounce == true:
		bounce()
		Global.bounce = false
		


func _on_VisibilityNotifier2D_screen_exited():
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://scenes/User Interface/Death_Screen.tscn")

func bounce():
	velocity.y -= JUMPFORCE * 0.7
	jump_sound.play()
	animation.play("jump")
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.8))
	
	if position.x < enemyposx:
		velocity.x = -800
		
	elif position.x > enemyposx:
		velocity.x = 800

	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/User Interface/Death_Screen.tscn")
