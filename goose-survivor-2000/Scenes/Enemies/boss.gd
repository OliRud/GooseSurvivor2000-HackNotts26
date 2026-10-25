extends CharacterBody2D

var TOUCHING_PLAYER = false
var attack_delay = 0.2

var health = 75
@export var speed = 25
var damage = 20

var player

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
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", Color.WHITE, 0.1)
	if health <= 0:
		die()

func die():
	get_tree().change_scene_to_file("res://Menus/Win.tscn")
	#get_tree().queue_delete(self)


func _on_give_damage_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = true
		while TOUCHING_PLAYER:
			await get_tree().create_timer(attack_delay).timeout
			body.receive_damage(damage)


func _on_give_damage_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		TOUCHING_PLAYER = false
