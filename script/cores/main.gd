extends VBoxContainer



func _on_button_pressed() -> void:
	$HSplitContainer/inspector.visible = not $HSplitContainer/inspector.visible
