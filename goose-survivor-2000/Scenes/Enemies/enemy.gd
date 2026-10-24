extends CharacterBody2D

# INSAANTIATE
# 1.sprite
# Sprite, animation, enemy_data

var TOUCHING_PLAYER = false
var attack_delay = 0.2

var health = 1
@export var speed = 0
var damage = 1

var player

var enemy_data = {
	"EVIL_GOOSE" : {"health" : 5, "speed" : 18, "damage" : 5},
	"ENEMY_2" : {"health" : 10, "speed" : 25, "damage" : 10}
}

func configure(sprite,animation,ref):
	
	for child in $Sprites.get_children():
		child.hide()
	$Sprites.find_child(sprite).visible = true
	health = enemy_data[ref]["health"]
	speed = enemy_data[ref]["speed"]
	damage = enemy_data[ref]["damage"]
	print("config succesfull: ",health,damage,speed)

func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("player")
	
	if player:
		var direction: Vector2 = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

func give_damage():
	pass

func receive_damage(damage):
	health -= damage
	print(health)
	$AnimationPlayer.play("Damage")
	if health <= 0:
		die()

func drop_loot():
	pass

func die():
	get_tree().queue_delete(self)


func _on_give_damage_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = true
		while TOUCHING_PLAYER:
			await get_tree().create_timer(attack_delay).timeout
			body.receive_damage(damage)


func _on_give_damage_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = false
