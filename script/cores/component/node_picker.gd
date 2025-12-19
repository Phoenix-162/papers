extends Window

var nodes:Dictionary = {
	name = "root",
	child = {
		"tes" = "res://script/nodes/node.gd",
		"tes2" = "res://script/nodes/node.gd",
		"tes3" ={
		name = "root1",
		child = {
			"tes2t" = "res://script/nodes/node.gd",
			"tes2" = "res://script/nodes/node.gd"},
			"tes3" ={
				name = "root1",
				child = {
				"tes" = "res://script/nodes/node.gd",
				"tes3" = "res://script/nodes/node.gd",
			}
		},
	},
	
}}
func pick(graph:GraphEdit)-> void:
	%cancel.pressed.connect(func (): hide())
	%selector.display(nodes)
	pass




func node_created(tree:Tree,graph:GraphEdit):
	var node:GraphNode = tree.get_selected().get_meta("node").duplicate(Node.DuplicateFlags.DUPLICATE_SCRIPTS)
	node.position_offset = (graph.scroll_offset + graph.size / 2) / graph.zoom - node.size / 2;
	graph.add_child(node)
	if node.has_method("create"):
		node.create()
	hide()
	pass

func node_selected(tree:Tree):
	if tree.get_selected() == null:
		%ok.disabled = true
		return
	if tree.get_selected().get_meta("node") == null:
		%ok.disabled = true
		return
	%ok.disabled = false
	var description:RichTextLabel = get_node("Panel/MarginContainer/wraper/PanelContainer/scroll2/RichTextLabel")
	description.text = tree.get_selected().get_meta("node").descripton
	pass


func _on_selector_selected(card: Control) -> void:
	pass # Replace with function body.
