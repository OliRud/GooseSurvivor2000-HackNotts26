extends Node2D

@export var health = 20
@export var score = 50
@export var food_drop = 6

func receive_damage(damage):
	health -= damage
