extends Marker2D

var enemy_scene = preload("res://Scenes/Enemies/enemy.tscn")

var spawn_threshold = {
	"EVIL_GOOSE" : 3,
	"BIRD" : 0,
	"SHEEP" : 0,
	"MOUSE" : 0,
}
var spawn_container = []

var loop = 0

signal spawn_enemy(scene)

func _ready() -> void:
	begin_spawn()
	

func begin_spawn():
	while Data.ONGOING:
		await get_tree().create_timer(1).timeout
		spawn_container = spawn_threshold
		for key in spawn_container:
			for entity in range(0,spawn_container[key]):
				if !Data.PAUSE:
					await get_tree().create_timer(1.8).timeout
					spawn_enemy.emit(enemy_scene,self.global_position,key)
				else:
					while Data.PAUSE:
						await get_tree().create_timer(1).timeout
		
		#increment stack
		await get_tree().create_timer(7).timeout
		loop += 1
		for key in spawn_container:
			if key == "EVIL_GOOSE":
				spawn_container[key] = round(spawn_container[key] * 1.3)
			spawn_container[key] = round(spawn_container[key] * 1.25)
		#add new enemies
		if loop == 2:
			spawn_container["BIRD"] += 3
		if loop == 8:
			spawn_container["SHEEP"] += 2
		if loop == 15:
			spawn_container["RAT"] += 3
