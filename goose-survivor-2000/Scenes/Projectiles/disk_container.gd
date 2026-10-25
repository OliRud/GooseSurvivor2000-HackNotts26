extends Node2D

var disk_scene = preload("res://Scenes/Projectiles/disk.tscn")
var main

func _ready() -> void:
	main = get_tree().current_scene

func fire(level):
	if level:
		for shot in range(1,9):
			print("FIRE")
			var proj = disk_scene.instantiate()
			proj.position = $Spawn.find_child(str(shot)).global_position
			proj.align_and_fire($Vectors.find_child(str(shot)).global_position - $Spawn.find_child(str(shot)).global_position,"enemy",level)
			main.find_child("Projectiles").add_child(proj)
