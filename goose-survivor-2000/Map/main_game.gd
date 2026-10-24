extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_spawn_enemy(scene: Variant, g_position, enemy_type) -> void:
	
	var entity = scene.instantiate()
	entity.position = g_position
	
	match enemy_type:
		"EVIL_GOOSE": #sprite, animation, stat sheet (0 animation mens null)
			entity.configure("1","1","EVIL_GOOSE")
		"ENEMY_2":
			entity.configure("2","0","ENEMY_2")
	
	$Enemies.add_child(entity)
