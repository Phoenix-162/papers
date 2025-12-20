extends PanelContainer
signal pressed(node)

func _on_button_pressed() -> void:
	if not has_meta("node") :
		emit_signal("pressed",null)
		return
	emit_signal("pressed",get_meta("node"))
	pass # Replace with function body.



func set_text (text:String):
	$margin/wraper/Label.text = text
func set_icon(img:Texture):
	$margin/wraper/Button/MarginContainer/TextureRect.texture = img
