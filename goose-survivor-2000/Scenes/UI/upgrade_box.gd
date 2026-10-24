extends PanelContainer

var upg

signal send(upgrade)

func update_contents(upgrade,description):
	
	$VBoxContainer/Label.text = description
	upg = upgrade

func _on_select_pressed() -> void:
	send.emit(upg)
