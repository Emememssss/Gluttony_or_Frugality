extends Node2D

export(Array, PackedScene) var scenes

const X_FOOD_MIN_DISTANCE = 20
const X_FOOD_MAX_DISTANCE = 100

var Y_FOOD_MIN_DISTANCE = -10
const Y_FOOD_MAX_DISTANCE = -100

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
	
	food_index = rand_range(0, scenes.size())
	new_food = scenes[food_index].instance()
	add_child(new_food)
	var spawn_position = Vector2(spawn_food_x, spawn_food_y)
	
	new_food.position = spawn_position
	
	var new_spawn_x = new_food.sprite_food_width + rand_range(X_FOOD_MIN_DISTANCE, X_FOOD_MAX_DISTANCE)
	spawn_food_x = spawn_food_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_FOOD_MIN_DISTANCE, Y_FOOD_MAX_DISTANCE)
	spawn_food_y = spawn_food_y + new_spawn_y
	
	if spawn_food_y < 300:
		spawn_food_y = 300
	
	if spawn_food_y > 600:
		spawn_food_y = 600

func create_new_item_food():
	_spawn_food()
