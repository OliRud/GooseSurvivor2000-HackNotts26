extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.roundplay()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_spawn_enemy(scene: Variant, g_position, enemy_type) -> void:
	
	var entity = scene.instantiate()
	entity.position = g_position
	
	match enemy_type:
		"EVIL_GOOSE": #sprite, animation, stat sheet (0 animation mens null)
			entity.configure("1","1","EVIL_GOOSE")
		"BIRD":
			entity.configure("2","3","BIRD")
		"SHEEP":
			entity.configure("3","1","SHEEP")
		"MOUSE":
			entity.configure("4","0","MOUSE")
	
	$Enemies.add_child(entity)
