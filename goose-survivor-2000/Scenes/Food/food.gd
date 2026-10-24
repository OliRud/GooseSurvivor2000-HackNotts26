extends Area2D

var level = 1 #up to 3

func _ready() -> void:
	level = randi_range(1,3)
	for x in $Sprites.get_children():
		x.hide()
	$Sprites.find_child(str(level)).show()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
