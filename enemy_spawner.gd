extends Node2D

export(Array, PackedScene) var scenes

var X_ENEMY_MIN_DISTANCE = 50
var X_ENEMY_MAX_DISTANCE = 400

const Y_ENEMY_MIN_DISTANCE = -250
const Y_ENEMY_MAX_DISTANCE = 250

const INITIAL_ENEMY_COUNT = 10
const INITIAL_X_ENEMY_SPAWN = 1000
const INITIAL_Y_ENEMY_SPAWN_MARGIN = -700

var spawn_ENEMY_x
var spawn_ENEMY_y

func _ready():
	spawn_ENEMY_y = get_viewport().get_viewport().size.y - INITIAL_Y_ENEMY_SPAWN_MARGIN
	spawn_ENEMY_x = INITIAL_X_ENEMY_SPAWN
	_spawn_initial_enemy()
	Signals.connect("create_new_enemy", self, "create_new_enemy")

func _spawn_initial_enemy():
	for counter in range(INITIAL_ENEMY_COUNT):
		_spawn_enemy()

func _spawn_enemy():
	var ENEMY_index
	var new_ENEMY
	
	if (Global.progress_score < 100):
		X_ENEMY_MIN_DISTANCE = 600
		X_ENEMY_MAX_DISTANCE = 1000
	
	elif (Global.progress_score > 100 and Global.progress_score <= 300):
		X_ENEMY_MIN_DISTANCE = 300
		X_ENEMY_MAX_DISTANCE = 600
	
	elif (Global.progress_score > 300 and Global.progress_score <= 600):
		X_ENEMY_MIN_DISTANCE = 100
		X_ENEMY_MAX_DISTANCE = 300
	
	elif (Global.progress_score > 600):
		X_ENEMY_MIN_DISTANCE = 20
		X_ENEMY_MAX_DISTANCE = 100
	
	ENEMY_index = rand_range(0, scenes.size())
	new_ENEMY = scenes[ENEMY_index].instance()
	add_child(new_ENEMY)
	var spawn_position = Vector2(spawn_ENEMY_x, spawn_ENEMY_y)
	
	new_ENEMY.position = spawn_position
	
	var new_spawn_x = new_ENEMY.sprite_enemy_width + rand_range(X_ENEMY_MIN_DISTANCE, X_ENEMY_MAX_DISTANCE)
	spawn_ENEMY_x = spawn_ENEMY_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_ENEMY_MIN_DISTANCE, Y_ENEMY_MAX_DISTANCE)
	spawn_ENEMY_y = spawn_ENEMY_y + new_spawn_y
	
	if spawn_ENEMY_y < -2000:
		spawn_ENEMY_y = -2000
	
	if spawn_ENEMY_y > -500:
		spawn_ENEMY_y = -500

func create_new_enemy():
	_spawn_enemy()
