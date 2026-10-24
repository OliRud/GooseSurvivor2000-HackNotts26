extends Area2D

var speed = 0.5
var direction = Vector2.ZERO
var damage_group
var damage

func align_and_fire(dir,group,level):
	direction = dir
	damage_group = group
	damage = level
	$Timer.start()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		position += direction * speed * delta
		rotate(0.05)

func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(damage_group):
		body.receive_damage(damage)
		queue_free()
