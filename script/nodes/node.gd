#headers for a node
extends PaperGraphNode
func init ():
	title = "testnode"
	displayName = "tess"
	size = Vector2(400,200)
	descripton = "tes 123"
func create():
	
	var btn:Button = Button.new()
	btn.text = "tes"
	btn.pressed.connect(func (): 
		papers.EventHooks.trigger_singular("tess","tesaaa")
		print(papers.EventHooks.return_values)
		)
	add_child(btn)
