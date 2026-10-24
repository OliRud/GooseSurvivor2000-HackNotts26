extends CharacterBody2D

# INSAANTIATE
# 1.sprite
# Sprite, animation, enemy_data

var food_scene = preload("res://Scenes/Food/food.tscn")

var TOUCHING_PLAYER = false
var attack_delay = 0.2

var health = 1
@export var speed = 0
var damage = 1

var player

var enemy_data = {
	"EVIL_GOOSE" : {"health" : 5, "speed" : 18, "damage" : 5},
	"BIRD" : {"health" : 7, "speed" : 27, "damage" : 7},
	"SHEEP" : {"health" : 20, "speed" : 13, "damage" : 15},
	"MOUSE" : {"health" : 5, "speed" : 50, "damage" : 3}
}

func configure(sprite,animation,ref):
	if animation:
		$AnimationPlayer.play(animation)
	for child in $Sprites.get_children():
		child.hide()
	$Sprites.find_child(sprite).visible = true
	health = enemy_data[ref]["health"]
	speed = enemy_data[ref]["speed"]
	damage = enemy_data[ref]["damage"]

func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("player")
	
	if player and !Data.PAUSE:
		var direction: Vector2 = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

func give_damage():
	pass

func receive_damage(damage):
	health -= damage
	$AnimationPlayer.play("Damage")
	if health <= 0:
		die()

func drop_loot():
	var corner1 = $"DropRange/1".global_position
	var corner2 = $"DropRange/2".global_position
	
	for x in range (1,3):
		var food = food_scene.instantiate()
		food.position.x = randi_range(corner1.x, corner2.x)
		food.position.y = randi_range(corner1.y, corner2.y)
		get_parent().get_parent().find_child("FoodStore").add_child(food)

func die():
	drop_loot()
	get_tree().queue_delete(self)


func _on_give_damage_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = true
		while TOUCHING_PLAYER:
			#if !Data.PAUSE: ## NOTE FIX THIS LATER
			await get_tree().create_timer(attack_delay).timeout
			body.receive_damage(damage)


func _on_give_damage_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = false
