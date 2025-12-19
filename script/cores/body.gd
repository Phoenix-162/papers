extends Node
var selector:Window = preload("res://scene/gui/node picker.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)


func _ready() -> void:
	var button: Button = Button.new()
	var menu : Control = $TabContainer/edittor/GraphEdit.get_menu_hbox()
	menu.add_child(button)
	button.text = "add node"
	button.flat = true
	button.pressed.connect(func ():
		select_node()
	)


func select_node ():
	selector.title = "add node"
	selector.size = Vector2(964,600)
	selector.unresizable = true
	selector.transient = true
	selector.exclusive = true
	if selector.get_parent() == null:
		selector.pick($TabContainer/edittor/GraphEdit)
		add_child(selector)
	selector.show()
	selector.move_to_center()
	selector.close_requested.connect(func (): 
		selector.hide()
		)
	pass
