extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.hide()



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Map/main_game.tscn")


func _on_credits_pressed() -> void:
	$Window.show()


func _on_window_close_requested() -> void:
	$Window.hide()
