#headers for a node
extends PaperGraphNode
func init ():
	category
	title = "testnode"
	displayName = "tess"
	size = Vector2(400,200)
	descripton = "tes 123"
func create():
	var btn:Button = Button.new()
	btn.text = "crash"
	add_child(btn)
	btn.pressed.connect(func (): 
		OS.crash("err"))
