extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_spawn_enemy(scene: Variant, g_position) -> void:
	var entity = scene.instantiate()
	entity.position = g_position
	$Enemies.add_child(entity)
