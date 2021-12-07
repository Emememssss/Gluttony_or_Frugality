extends Node2D

var foods = 0
var ADD_SPEED = 0


func _ready():
	pass # Replace with function body.


func _on_food_collected():
	var FoodScore = "Foods: " +String(foods)
	Global.foods += 1
