extends CanvasLayer

@onready var parent = self.get_parent()


# UPGRADE : Description
const BUCKET = {
	1 : ["HEALTH_CAP","Increase your health cap"],
	2 : ["NOKIA_SKILL","Throw bricks"],
	3 : ["PRETZEL_SKILL","mmmmmmm"],
	4 : ["SHRINK_SKILL","Shrink your hitbox"],
	5 : ["SPEED_SKILL","Walk Faster"],
	6 : ["HONK_SKILL","Increase size of default attack"],
	7 : ["DISK_SKILL","placeholder"]
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel.hide()
	$UpgradesContainer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$XP.max_value = parent.STATS["XP_CAP"]
	$XP.value = parent.STATS["XP"]
	$Health.max_value = parent.STATS["HEALTH_CAP"]
	$Health.value = parent.STATS["HEALTH"]

func refresh_upgrades():
	$Panel.show()
	$UpgradesContainer.show()
	for x in $UpgradesContainer.get_children():
		var selected_upgrade = randi_range(1,7)
		x.update_contents(BUCKET[selected_upgrade][0],BUCKET[selected_upgrade][1])

func receive_upgrade(upgrade): #response from whichever upgrade was picked
	parent.STATS[upgrade] += 1
	Data.PAUSE = false
	$Panel.hide()
	$UpgradesContainer.hide()
