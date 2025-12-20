extends GridContainer
signal selected(card:Control)
var group_stack:Array 
var card = preload("res://scene/gui/components/selection card.tscn")
var card_storage:Node = Node.new()
var node_storage:Node = Node.new()

func _init() -> void:
	papers.storage.node.add_child(card_storage)
	card_storage.name = "cards"
	papers.storage.node.add_child(node_storage)
	node_storage.name = "nodes"





func display(nodes:Dictionary):
	for id in nodes.child.keys():
		var node = nodes.child[id]
		var new_card = card.instantiate()
		new_card.pressed.connect(pressed.bind(new_card))
		if node is Dictionary:
			add_child(new_card)
			new_card.set_text(nodes.child[id].name)
			new_card.set_meta("child",nodes.child[id])
			pass
		else:
			var node_meta = GraphNode.new()
			node_meta.set_script(load(node))
			node_meta.name = "node"
			new_card.add_child(node_meta)
			node_meta.visible = false
			node_meta.init()
			new_card.set_text(node_meta.displayName)
			node_storage.add_child(node_meta)
			add_child(new_card)
	pass


func pressed(card_self:Control):
	#todo implemet the grup open featue prevues one got memeory leak
	var node = card_self.get_node("node")
	if not node == null:
		print(node.displayName)
		pass 
	else:
		pass
	pass


func _on_back_pressed() -> void:
	for i:Control in get_children():
		i.queue_free()
	pass # Replace with function body.
