extends GridContainer
signal selected(card:Control)
var group_stack:Array 
var card = preload("res://scene/gui/components/selection card.tscn")
var card_storage:Node = Node.new()
var node_storage:Node = Node.new()

func _init() -> void:
	papers.storage.node.add_child(card_storage)
	papers.storage.node.add_child(node_storage)





func display(nodes:Dictionary):
	for id in nodes.child.size():
		var node_meta = GraphNode.new()
		var node = nodes.child[id]
		var new_card = card.instantiate()
		if nodes.child[id] is Dictionary:
			#if car is a gorup
			new_card.set_meta("group",nodes.child[id])
		else:
			node_meta.set_script(load(node))
			node_meta.visible = false
			new_card.set_meta("node",node_meta)
			node_storage.add_child(node_meta)
		add_child(new_card)
		new_card.pressed.connect(pressed.bind(new_card))
	pass


func pressed(node,card_self):
	if card_self.has_meta("node"):
		pass 
	else:
		pass
		#%back.disabled = false
		#group_stack.append(get_children())
		#for i:Control in get_children():
			#i.visible = false
			#i.reparent(card_storage)
		#display(card_self.get_meta("group"))
	pass


func _on_back_pressed() -> void:
	print_orphan_nodes()
	var prev = group_stack.pop_back()
	for k in get_children():
		k.queue_free()
		pass
	for i in get_children():
		i.queue_free()
		pass
	for j:Control in prev:
		j.visible = true
		j.reparent(self)
		pass
	
	pass # Replace with function body.
