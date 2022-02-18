extends Node2D

export(Array, PackedScene) var scenes

var X_badfood_MIN_DISTANCE = 20
var X_badfood_MAX_DISTANCE = 100

const Y_badfood_MIN_DISTANCE = -100
const Y_badfood_MAX_DISTANCE = 100

const INITIAL_badfood_COUNT = 10
const INITIAL_X_badfood_SPAWN = 100
const INITIAL_Y_badfood_SPAWN_MARGIN = 80

var spawn_badfood_x
var spawn_badfood_y

func _ready():
	spawn_badfood_y = get_viewport().get_viewport().size.y - INITIAL_Y_badfood_SPAWN_MARGIN
	spawn_badfood_x = INITIAL_X_badfood_SPAWN
	_spawn_initial_badfood()
	Signals.connect("create_new_item_badbadfood", self, "create_new_item_badbadfood")

func _spawn_initial_badfood():
	for counter in range(INITIAL_badfood_COUNT):
		_spawn_badfood()

func _spawn_badfood():
	var badfood_index
	var new_badfood
	
	#if (Global.progress_score < 100):
	#	X_badfood_MIN_DISTANCE = 600
	#	X_badfood_MAX_DISTANCE = 1000
	
	#elif (Global.progress_score > 100 and Global.progress_score <= 300):
	#	X_badfood_MIN_DISTANCE = 300
	#	X_badfood_MAX_DISTANCE = 600
	
#	elif (Global.progress_score > 300 and Global.progress_score <= 600):
	#	X_badfood_MIN_DISTANCE = 100
	#	X_badfood_MAX_DISTANCE = 300
	
	#elif (Global.progress_score > 600):
	#	X_badfood_MIN_DISTANCE = 20
	#	X_badfood_MAX_DISTANCE = 100
	
	badfood_index = rand_range(0, scenes.size())
	new_badfood = scenes[badfood_index].instance()
	add_child(new_badfood)
	var spawn_position = Vector2(spawn_badfood_x, spawn_badfood_y)
	
	new_badfood.position = spawn_position
	
	var new_spawn_x = new_badfood.sprite_badfood_width + rand_range(X_badfood_MIN_DISTANCE, X_badfood_MAX_DISTANCE)
	spawn_badfood_x = spawn_badfood_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_badfood_MIN_DISTANCE, Y_badfood_MAX_DISTANCE)
	spawn_badfood_y = spawn_badfood_y + new_spawn_y
	
	if spawn_badfood_y < 200:
		spawn_badfood_y = 200
	
	if spawn_badfood_y > 560:
		spawn_badfood_y = 560

func create_new_item_badfood():
	_spawn_badfood()
