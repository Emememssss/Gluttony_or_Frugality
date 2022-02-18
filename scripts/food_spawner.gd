extends Node2D

export(Array, PackedScene) var scenes

var X_FOOD_MIN_DISTANCE = 20
var X_FOOD_MAX_DISTANCE = 100

const Y_FOOD_MIN_DISTANCE = -100
const Y_FOOD_MAX_DISTANCE = 100

const INITIAL_FOOD_COUNT = 10
const INITIAL_X_FOOD_SPAWN = 100
const INITIAL_Y_FOOD_SPAWN_MARGIN = 80


var spawn_food_x
var spawn_food_y

func _ready():
	spawn_food_y = get_viewport().get_viewport().size.y - INITIAL_Y_FOOD_SPAWN_MARGIN
	spawn_food_x = INITIAL_X_FOOD_SPAWN
	_spawn_initial_food()
	Signals.connect("create_new_item_food", self, "create_new_item_food")

func _spawn_initial_food():
	for counter in range(INITIAL_FOOD_COUNT):
		_spawn_food()

func _spawn_food():
	var food_index
	var new_food
	
	var level1 = 1000
	var level2 = 2000
	var level3 = 3000
	
	if (Global.progress_score < level1):
		X_FOOD_MIN_DISTANCE = 20
		X_FOOD_MAX_DISTANCE = 100
	
	elif (Global.progress_score > level1 and Global.progress_score <= level2):
		X_FOOD_MIN_DISTANCE = 100
		X_FOOD_MAX_DISTANCE = 300
	
	elif (Global.progress_score > level2 and Global.progress_score <= level3):
		X_FOOD_MIN_DISTANCE = 300
		X_FOOD_MAX_DISTANCE = 600
	
	elif (Global.progress_score > level3):
		X_FOOD_MIN_DISTANCE = 600
		X_FOOD_MAX_DISTANCE = 1000
	
	
	food_index = rand_range(0, scenes.size())
	new_food = scenes[food_index].instance()
	add_child(new_food)
	var spawn_position = Vector2(spawn_food_x, spawn_food_y)
	
	new_food.position = spawn_position
	
	var new_spawn_x = new_food.sprite_food_width + rand_range(X_FOOD_MIN_DISTANCE, X_FOOD_MAX_DISTANCE)
	spawn_food_x = spawn_food_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_FOOD_MIN_DISTANCE, Y_FOOD_MAX_DISTANCE)
	spawn_food_y = spawn_food_y + new_spawn_y
	
	if spawn_food_y < 200:
		spawn_food_y = 200
	
	if spawn_food_y > 560:
		spawn_food_y = 560

func create_new_item_food():
	_spawn_food()
