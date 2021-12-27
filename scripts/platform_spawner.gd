extends Node2D

export (Array, PackedScene) var scenes

export var X_MIN_DISTANCE = 5
export var X_MAX_DISTANCE = 5

const Y_MIN_DISTANCE = 0
const Y_MAX_DISTANCE = 0

const INITIAL_PLATFORMS_COUNT = 20
const INITIAL_X_SPAWN = 100
const INITIAL_Y_SPAWN_MARGIN = -500

var spawn_x
var spawn_y

func _ready():
	spawn_y = get_viewport().get_viewport().size.y - INITIAL_Y_SPAWN_MARGIN
	spawn_x = INITIAL_X_SPAWN
	_spawn_initial_platforms()
	Signals.connect("create_new_platform", self, "create_new_platform")

func _spawn_initial_platforms():
	for counter in range(INITIAL_PLATFORMS_COUNT):
		_spawn_platform()

func _spawn_platform():
	var index
	var new_platform
	
	index = rand_range(0, scenes.size())
	new_platform = scenes[index].instance()
	add_child(new_platform)
	var spawn_position = Vector2(spawn_x, spawn_y)
	
	new_platform.position = spawn_position
	
	var new_spawn_x = new_platform.sprite_width + rand_range(X_MIN_DISTANCE, X_MAX_DISTANCE)
	spawn_x = spawn_x + new_spawn_x
	
	var new_spawn_y = rand_range(Y_MIN_DISTANCE, Y_MAX_DISTANCE)
	spawn_y = spawn_y + new_spawn_y
	
	if spawn_y < 300:
		spawn_y = 300
	
	if spawn_y > 600:
		spawn_y = 600

func create_new_platform():
	_spawn_platform()
