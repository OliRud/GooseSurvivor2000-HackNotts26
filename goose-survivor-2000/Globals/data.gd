extends Node

var wave = 1
var PAUSE = false
var ONGOING = true
var TIMER = 200
var won = false

func roundplay() -> void:
	await get_tree().create_timer(4).timeout
	while TIMER != 0:
		await get_tree().create_timer(1).timeout
		if !PAUSE:
			TIMER -= 1
	ONGOING = false

func refresh():
	TIMER = 200
