extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0

var immunity = false
var immunity_timer = 0.6

var fire_nokia_cooldown = false

@onready var default_weapon = $Slash
@onready var nokia_launcher = $NokiaLauncher

var STATS = {
	"HEALTH" : 100,
	"XP" : 0,
	"XP_CAP" : 100,
	"HEALTH_CAP" : 100,
	"NOKIA_SKILL" : 5, #/5
	"PRETZEL_SKILL" : 0,
	"SHRINK_SKILL" : 0,
	"SPEED_SKILL" : 0,
	"HONK_SKILL" : 1,
	"DISK_SKILL" : 0
}

func _ready() -> void:
	default_weapon.hide()
	pass

func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	default_weapon.look_at(mouse_pos)
	nokia_launcher.look_at(mouse_pos)

	# MOVEMENT + Animation
	var move_input = Input.get_vector("left", "right", "up", "down")
	if !Data.PAUSE:
		velocity = move_input * SPEED
		move_and_slide()
	if velocity:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.play("RESET")
	
	
	#Click
	if Input.is_action_just_pressed("click") and !Data.PAUSE:
		#slash
		slash()
		#nokia
		if !fire_nokia_cooldown:
			fire_nokia()
			fire_nokia_cooldown = true
			$Timers/NokiaTImer.start()
		print("*Click*")
	
	
	# MOUSE TRACK
	if mouse_pos.x < global_position.x:
		$Sprite2D.flip_h = false
	elif mouse_pos.x > global_position.x:
		$Sprite2D.flip_h = true

func acquire_food(xp):
	STATS["XP"] += xp
	level_check()

func level_check():
	if STATS["XP"] >= STATS["XP_CAP"]:
		Data.PAUSE = true
		STATS["XP"] = 0
		STATS["XP_CAP"] *= 1.25
		$UI.refresh_upgrades()

# DAMAGE RECEIVE
func receive_damage(damage):
	if immunity == false:
		STATS["HEALTH"] -= damage
		$AnimationPlayer.play("Damage")
		
		death_check()
		
		#activate immunity
		immunity = true
		$Timers/Immunity.start()

func death_check():
	pass

# ATTACK FUNCTIONS
func slash():
	default_weapon.slash(STATS["HONK_SKILL"])

func fire_nokia():
	nokia_launcher.fire(STATS["NOKIA_SKILL"])

# TIMERS
func _on_immunity_timeout() -> void:
	immunity = false

func _on_attack_t_imer_timeout() -> void:
	pass # Replace with function body.

func _on_nokia_t_imer_timeout() -> void:
	fire_nokia_cooldown = false
