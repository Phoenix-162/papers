extends Node

signal plugin_loaded #emited when all plugin are loaded
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
	#static func loadPlugins(folder:String):
		#pass
	static func _static_init() -> void:
		pass
	
	#static func loadDir(path:String):
		#pass
	static func loadzip(path:String):
		#read from a zip file
		var reader = ZIPReader.new()
		#var folder = DirAccess.open(path)
		if reader.open(path) != OK:
			OS.alert("cant load plugin at" + "\"" + path + "\"" )
			return
		print(reader.get_files())
		for file in reader.get_files():
			if file == "header.gd":
				var plugin = Resource.new()
				var script = GDScript.new()
				script.source_code = reader.read_file(file).get_string_from_utf8()
				script.reload()
				plugin.set_script(script)
				plugin.plugin_path = path
				await plugin.init()
				Storage.data["Plugins"][plugin.name] = plugin
				pass
		reader.close()
	pass
class EventHooks:
	static var hooks:Dictionary[StringName, Variant]
	static var return_values:Dictionary[StringName,Variant]
	# create new event hook 
	static func create(name,events:Array[Callable],...args):
		if events.size() == 1:
			hooks[name] = events[0].bindv(args)
			return
		var arr = []
		for event:Callable in events:
			arr.append(event.bindv(args))
		if not hooks.has(name) or hooks[name].is_empty(): 
			hooks[name] = arr
		else:
			hooks[name].append_array(arr)
		pass
	#call the event hook with acritary number of pararameter
	static func trigger(name:StringName,...args):
		if not hooks.has(name):
			return
		#for triggering hooks that only a single function
		if hooks[name] is Callable:
			return_values[name] = hooks[name].callv(args)
		#for triggering hooks that has mutiple function
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

func _ready() -> void:
	var reader = FileAccess.open("C:/Users/ASUS/Desktop/list.txt",FileAccess.READ)
	Storage.data["nodes"] = {name = "root",child = {}}
	Storage.data["Plugins"] =  {}
	for item in reader.get_as_text().remove_char(ord("\n")).split("\\",false,0):
		PluginLoader.loadzip(item.strip_edges())
	emit_signal("plugin_loaded")
	add_child(Storage.node)
	pass
	
