extends Node


class storage :
	static var node = Node.new()
	static func _static_init() -> void:
		node.name = "storage"



func _init() -> void:
	add_child(storage.node)
	pass
	
