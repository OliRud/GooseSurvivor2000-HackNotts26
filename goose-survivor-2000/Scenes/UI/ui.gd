extends CanvasLayer

@onready var parent = self.get_parent()


# UPGRADE : Description
const BUCKET = {
	1 : ["HEALTH_CAP","Boost Health"],
	2 : ["NOKIA_SKILL","Throw Nokias"],
	3 : ["PRETZEL_SKILL","spinning pretzels"],
	4 : ["SPEED_SKILL","Movement Speed"],
	5 : ["HONK_SKILL","Honk Attack"],
	6 : ["DISK_SKILL","Sharp Disks"]
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
	$Timer.text = str(Data.TIMER)

func refresh_upgrades():
	$Panel.show()
	$UpgradesContainer.show()
	for x in $UpgradesContainer.get_children():
		var selected_upgrade = randi_range(1,6)
		x.update_contents(BUCKET[selected_upgrade][0],BUCKET[selected_upgrade][1])

func receive_upgrade(upgrade): #response from whichever upgrade was picked
	parent.STATS[upgrade] += 1
	if upgrade == "HEALTH_CAP":
		parent.STATS["HEALTH_CAP"] += 25
		parent.STATS["HEALTH"] = parent.STATS["HEALTH_CAP"]
	elif upgrade == "SPEED_SKILL":
		parent.SPEED += 3
	Data.PAUSE = false
	$Panel.hide()
	$UpgradesContainer.hide()
