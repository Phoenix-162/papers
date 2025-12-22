extends Window

var nodes:Dictionary = {
	name = "root",
	child = {
		"q" = "res://script/nodes/node.gd",
		"w" = {
			name = "w",
			child = {
				"q" = "res://script/nodes/node.gd",
			}
		}
	}
}

@warning_ignore("unused_parameter")
func start(graph:GraphEdit):
	papers.EventHooks.create_singular("tess",func (tes:String): 
		OS.alert(tes)
		return tes
		)
	pass


func pick(graph:GraphEdit)-> void:
	%selector.selected.connect(node_selected.bind(graph))
	%cancel.pressed.connect(func (): hide())
	%selector.display(nodes)
	pass


func create_node(card:Control,graph:GraphEdit):
	var node:GraphNode = card.get_node_or_null("node").duplicate(DuplicateFlags.DUPLICATE_SCRIPTS)
	node.visible = true
	node.position_offset = (graph.scroll_offset + graph.size / 2) / graph.zoom - node.size / 2;
	graph.add_child(node)
	if node.has_method("create"):
		node.create()
	hide()
	pass


func node_selected(card: Control,graph:GraphEdit) -> void:
	%ok.pressed.connect(create_node.bind(card,graph))
	%ok.disabled = false
	pass # Replace with function body.


@warning_ignore("unused_parameter")
func _on__folder_opened(card: Control, child: Dictionary) -> void:
	pass # Replace with function body.
