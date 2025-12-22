extends Node


class Storage :
	static var node = Node.new()
	static var data:Dictionary[StringName,Variant]
	static func _static_init() -> void:
		node.name = "storage"

class DockingManager:
	enum DockingPosition{
		Bottom,
		right
	}
	static func create():
		pass
	pass

class PluginLoader:
	pass

class EventHooks:
	static var hooks:Dictionary[StringName, Callable]
	static var return_values:Dictionary[StringName,Variant]
	static func create_singular(name:StringName,event:Callable,...args):
		hooks[name] = event.bindv(args)
		pass
	static func trigger_singular(name:StringName,...args):
		if not hooks.has(name):
			OS.alert("event hooks named "  + name + " is invalid or delated")
			return
		if hooks[name] is Callable:
			return_values[name] = hooks[name].callv(args)
		else :
			OS.alert("event hooks named "  + name + " is invalid or delated")
		pass
	pass

func _init() -> void:
	add_child(Storage.node)
	pass
	
