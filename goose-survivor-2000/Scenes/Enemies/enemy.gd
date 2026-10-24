extends CharacterBody2D

# INSAANTIATE
# 1.sprite
# Sprite, animation, enemy_data

var health = 0
@export var speed = 20
var damage = 0

var player

var enemy_data = {
	"EVIL_GOOSE" : {"health" : 5, "speed" : 5, "damage" : 4}
}

func instantiate(sprite,animation,enemy_data):
	
	for child in $Sprites.get_children():
		child.hide()
	$Sprites.find_child(sprite).visible = true

func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("player")
	print(player.global_position)
	
	if player:
		var direction: Vector2 = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

func give_damage():
	pass

func receive_damage():
	pass

func die():
	pass
