extends Area2D

var damage

func _process(delta: float) -> void:
	rotate(0.03)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.receive_damage(damage)
