extends Window

var nodes:Dictionary = {
	name = "root",
	child = {
		"q" = "res://script/nodes/node.gd",
		"w" = {
			name = "w",
			child = {
				"q" = "res://script/nodes/node.gd",
				"qq" = "res://script/nodes/node.gd",
			}
		}
	}
}
func pick(graph:GraphEdit)-> void:
	%selector.selected.connect(node_selected.bind(graph))
	%cancel.pressed.connect(func (): hide())
	%selector.display(nodes)
	pass


func node_created(card:Control,graph:GraphEdit):
	var node:GraphNode =card.get_node_or_null("node")
	if node == null:
		return
	node.position_offset = (graph.scroll_offset + graph.size / 2) / graph.zoom - node.size / 2;
	graph.add_child(node)
	if node.has_method("create"):
		node.create()
	hide()
	pass


func node_selected(card: Control,graph:GraphEdit) -> void:
	print(card)
	pass # Replace with function body.
