extends Node


class Storage :
	static var node = Node.new()
	static func _static_init() -> void:
		node.name = "storage"

class DockingManager:
	pass

class PluginLoader:
	pass

class EventHooks:
	pass

func _init() -> void:
	add_child(Storage.node)
	pass
	
