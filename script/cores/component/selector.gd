extends GridContainer
signal selected(card:Control)
var group_stack:Array 
var card = preload("res://scene/gui/components/selection card.tscn")


func display(nodes:Dictionary):
	for id in nodes.child.keys():
		var card_obj:Control = card.instantiate()
		card_obj.pressed.connect(pressed.bind(card_obj))
		if nodes.child[id] is Dictionary:
			card_obj.set_meta("child",nodes.child[id])
			add_child(card_obj)
			card_obj.set_text("yyy")
		else :
			var node_meta:GraphNode = GraphNode.new()
			node_meta.set_script(load(nodes.child[id]))
			node_meta.init()
			card_obj.set_text(node_meta.displayName)
			card_obj.set_meta("node",node_meta)
			add_child(card_obj)
			pass
	%back.pressed.connect(func ():
		if group_stack.size() == 1:
			%back.disabled = true
		for i in get_children():
			i.queue_free()
		for i in papers.storage.node.get_children():
			i.free()
		for i in group_stack.pop_back():
			add_child(i)
		)


func pressed(node,card_self):
	if node == null:
		group_stack.push_back(get_children())
		%back.disabled = false
		for i in get_children():
			papers.storage.node.add_child(node)
			remove_child(i)
		display(card_self.get_meta("child"))
		emit_signal("selected",card_self)
	else :
		emit_signal("selected",card_self)
