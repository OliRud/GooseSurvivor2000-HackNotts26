extends Node2D

@export var health = 25
@export var score = 50
@export var food_drop = 7

var food_scene = preload("res://Scenes/Food/food.tscn")

func receive_damage(damage):
	health -= damage
	$AnimationPlayer.play("hit")
	
	if health <= 0:
		drop_loot()

func drop_loot():
	var corner1 = $"DropRange/1".global_position
	var corner2 = $"DropRange/2".global_position
	
	for x in range (1,3):
		var food = food_scene.instantiate()
		food.position.x = randi_range(corner1.x, corner2.x)
		food.position.y = randi_range(corner1.y, corner2.y)
		get_tree().current_scene.find_child("FoodStore").add_child(food)
	
	queue_free()
