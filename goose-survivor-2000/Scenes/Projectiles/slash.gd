extends Area2D

signal slash_finished()

var fatal = false

var bodies = []

func slash(damage):
	show()
	$AnimatedSprite2D.play("default")
	fatal = true
	for body in bodies:
		if body.is_in_group("enemy"):
			body.receive_damage(damage)
	$Timer.start()


func _on_animated_sprite_2d_animation_finished() -> void:
	hide()

func _on_timer_timeout() -> void:
	fatal = false

func _on_body_entered(body: Node2D) -> void:
	if bodies.has(body):
		pass
	else:
		bodies.append(body)
		print(bodies)

func _on_body_exited(body: Node2D) -> void:
	if bodies.has(body):
		bodies.erase(body)
		print("removed body")
