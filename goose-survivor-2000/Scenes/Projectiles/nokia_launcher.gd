extends Node2D

var projectile_scene = preload("res://Scenes/Projectiles/projectile.tscn")

var main

func _ready() -> void:
	main = get_tree().current_scene

func _process(delta: float) -> void:
	print($"Vectors/1".global_position)

func fire(level):
	if level:
		for shot in range (1,level+1):
			print("FIRE")
			var proj = projectile_scene.instantiate()
			proj.position = $Spawn.find_child(str(shot)).global_position
			proj.align_and_fire($Vectors.find_child(str(shot)).global_position - $Spawn.find_child(str(shot)).global_position)
			main.find_child("Projectiles").add_child(proj)
