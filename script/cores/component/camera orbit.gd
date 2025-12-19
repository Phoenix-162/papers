extends Node3D

var dragging = false
var sensitivity = 0.01

func _input(event:InputEvent):
	if event is InputEventMouseButton and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
		dragging = event.is_pressed()
	if event is InputEventMouseMotion and dragging:
		rotation.y -= event.relative.x*sensitivity
		rotation.x -= event.relative.y*sensitivity
		rotation.x = clamp(rotation.x,-PI/2.0,PI/2.0)
	if event is InputEventMouseButton and event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_UP:
		var scroll_value = event.factor if event.factor else 1.0
		$Camera3D.position.z += scroll_value /10
	elif event is InputEventMouseButton and event.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN:
		var scroll_value = event.factor if event.factor else 1.0
		if not $Camera3D.position.z < 0 :
			$Camera3D.position.z -= scroll_value / 10
