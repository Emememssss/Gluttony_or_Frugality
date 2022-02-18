extends Node2D

export(Array, PackedScene) var scenes

var X_CANDY_MIN_DISTANCE = 1000
var X_CANDY_MAX_DISTANCE = 10000

var Y_CANDY_MIN_DISTANCE = -200
const Y_CANDY_MAX_DISTANCE = 200

const INITIAL_CANDY_COUNT = 10
const INITIAL_X_CANDY_SPAWN = 200
const INITIAL_Y_CANDY_SPAWN_MARGIN = 180

var spawn_candy_x
var spawn_candy_y

func _ready():
	spawn_candy_y = get_viewport().get_viewport().size.y - INITIAL_Y_CANDY_SPAWN_MARGIN
	spawn_candy_x = INITIAL_X_CANDY_SPAWN
	_spawn_initial_candy()
	Signals.connect("create_new_candy", self, "create_new_candy")

func _spawn_initial_candy():
	for counter in range(INITIAL_CANDY_COUNT):
		_spawn_candy()

func _spawn_candy():
	var candy_index
	var new_candy
	
	candy_index = rand_range(0, scenes.size())
	new_candy = scenes[candy_index].instance()
	add_child(new_candy)
	var spawn_position = Vector2(spawn_candy_x, spawn_candy_y)
	
	new_candy.position = spawn_position
	
	var new_spawn_x = new_candy.sprite_candy_width + rand_range(X_CANDY_MIN_DISTANCE, X_CANDY_MAX_DISTANCE)
	spawn_candy_x = spawn_candy_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_CANDY_MIN_DISTANCE, Y_CANDY_MAX_DISTANCE)
	spawn_candy_y = spawn_candy_y + new_spawn_y
	
	if spawn_candy_y < 300:
		spawn_candy_y = 300
	
	if spawn_candy_y > 560:
		spawn_candy_y = 560

func create_new_candy():
	_spawn_candy()
