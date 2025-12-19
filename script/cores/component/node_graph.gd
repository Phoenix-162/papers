@abstract
extends GraphNode
class_name PaperGraphNode
var displayName = ""
var descripton = ""
var category = ""
var id = ""
var node:GraphNode





@abstract func init()
func add_input():
	set_slot(0,true,1,Color.RED,false,0,Color.BLUE)
	pass
func add_output():
	pass
