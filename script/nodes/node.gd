#headers for a node
extends PaperGraphNode
func init ():
	title = "testnode"
	displayName = "tess"
	size = Vector2(400,200)
	descripton = "tes 123"
func create():
	
	var btn:Button = Button.new()
	btn.text = "pause"
	
	add_child(btn)
