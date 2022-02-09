extends Node2D

var foods = 0
var ADD_SPEED = 0
var badfoods = 0


func _ready():
	pass # Replace with function body.


func _on_food_collected():
	var FoodScore = "Foods: " +String(foods)
	Global.foods += 1

func _on_badfood_collected():
	var BadFoodScore = "Bad Foods: "+String(badfoods)
	Global.badfoods += 1


func _on_yes_button_pressed():
	pass # Replace with function body.
