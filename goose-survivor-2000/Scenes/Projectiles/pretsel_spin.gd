extends Node2D

@onready var player = get_parent()

func _ready() -> void:
	for x in get_children():
		x.hide()
		x.monitoring = false

func _process(delta: float) -> void:
	rotate(0.03)
	for x in range(1,player.STATS["PRETZEL_SKILL"] + 1):
		if x < player.STATS["PRETZEL_SKILL"] + 1:
			get_child(x).show()
			get_child(x).monitoring = true
	for child in get_children():
		child.damage = player.STATS["PRETZEL_SKILL"]
