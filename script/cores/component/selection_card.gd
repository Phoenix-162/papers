extends PanelContainer
signal pressed()


func set_text (text:String):
	$margin/wraper/Label.text = text
func set_icon(img:Texture):
	$margin/wraper/Button/MarginContainer/TextureRect.texture = img


func _on_button_button_down() -> void:
	emit_signal("pressed")
	pass # Replace with function body.
