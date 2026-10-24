extends Marker2D

var enemy_scene = preload("res://Scenes/Enemies/enemy.tscn")

signal spawn_enemy(scene)

func _ready() -> void:
	spawn_enemy.emit(enemy_scene,self.global_position)
