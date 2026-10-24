extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0


var STATS = {
	"HEALTH" : 100,
	"XP" : 0,
	"XP_CAP" : 100,
	"NOKIA_SKILL" : 0, #/5
	"PRETZEL_SKILL" : 0,
	"SHRINK_SKILL" : 0,
	"SPEED_SKILL" : 0,
	"HONK_SKILL" : 1,
	"DISK_SKILL" : 0
}


func _physics_process(delta: float) -> void:

	# MOVEMENT + Animation
	var move_input = Input.get_vector("left", "right", "up", "down")
	velocity = move_input * SPEED
	if velocity:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.play("RESET")
	move_and_slide()
	
	
	#Click
	if Input.is_action_just_pressed("click"):
		print("*Click*")
	
	
	# MOUSE TRACK
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x < global_position.x:
		$Sprite2D.flip_h = false
	elif mouse_pos.x > global_position.x:
		$Sprite2D.flip_h = true
