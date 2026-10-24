extends Node

var wave = 1
var PAUSE = false
var ONGOING = true
var TIMER = 300

func roundplay() -> void:
	await get_tree().create_timer(4).timeout
	while TIMER != 0:
		await get_tree().create_timer(1).timeout
		TIMER -= 1
	ONGOING = false
