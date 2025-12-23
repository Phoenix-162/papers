extends Node


class Storage :
	static var node = Node.new()
	static var data:Dictionary[StringName,Variant]
	static func _static_init() -> void:
		node.name = "storage"

class DockingManager:
	enum DockingPosition{
		Bottom,
		left,
		main,
		right
	}
	static func create():
		pass
	pass

class PluginLoader:
	static func loadzip(path:String):
		#readd a zip file
		var reader = ZIPReader.new()
		var folder = DirAccess.open(path)
		if reader.open(path) != OK:
			OS.alert("cant load plugin at" + "\"" + path + "\"" )
			return
		for file_path in reader.get_files():
			if file_path.ends_with("/"):
				# what hapend if path is a folder
				continue
			print(reader.read_file(file_path).get_string_from_utf8())
		reader.close()
	pass


class EventHooks:
	static var hooks:Dictionary[StringName, Variant]
	static var return_values:Dictionary[StringName,Variant]
	static func create_grouped(name,events:Array[Callable],...args):
		var arr = []
		for event:Callable in events:
			arr.append(event.bindv(args))
		if not hooks.has(name) or hooks[name].is_empty(): 
			hooks[name] = arr
		else:
			hooks[name].append_array(arr)
		pass
	static func create_singular(name:StringName,event:Callable,...args):
		hooks[name] = event.bindv(args)
		pass
	static func trigger(name:StringName,...args):
		if not hooks.has(name):
			return
		if hooks[name] is Callable:
			return_values[name] = hooks[name].callv(args)
		if hooks[name] is Array:
			var ret:Array
			for event in hooks[name]:
				if event is Callable:
					ret.append(event.callv(args))
			return_values[name] = ret
			pass
		pass
	pass

class thmemeManager:
	pass


func _init() -> void:
	PluginLoader.loadzip("C:/Users/ASUS/Documents/games project/papers/.godot/tes.zip")
	add_child(Storage.node)
	pass
	
