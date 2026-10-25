extends PanelContainer

var upg

signal send(upgrade)

func update_contents(upgrade,description):
	$VBoxContainer/Label.text = description
	upg = upgrade
	$VBoxContainer/Select.disabled = true
	await get_tree().create_timer(1).timeout
	$VBoxContainer/Select.disabled = false

func _on_select_pressed() -> void:
	send.emit(upg)
