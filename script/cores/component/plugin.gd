@abstract
extends RefCounted
class_name PluginHead
var name = ""
var description = ""
var configs = {}
var plugin_path = ""
@abstract
func init()
func add_node(node:Dictionary):
	var reader = ZIPReader.new()
	var nodes = node.duplicate(true)
	reader.open(plugin_path)
	for i in node.child.keys():
		nodes.child[i] = reader.read_file(node.child[i])
	papers.Storage.data["nodes"].child[name] = nodes
