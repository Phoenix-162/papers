extends PanelContainer
signal pressed()

func _on_button_pressed() -> void:
	emit_signal("pressed")
	pass # Replace with function body.



func set_text (text:String):
	$margin/wraper/Label.text = text
func set_icon(img:Texture):
	$margin/wraper/Button/MarginContainer/TextureRect.texture = img
