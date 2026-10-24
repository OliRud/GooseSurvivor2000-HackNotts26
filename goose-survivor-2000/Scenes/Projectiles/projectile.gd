extends Area2D

var speed = 1
var direction = Vector2.ZERO

func align_and_fire(dir):
	direction = dir
	$Timer.start()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		position += direction * speed * delta

func _on_timer_timeout() -> void:
	queue_free()
