extends Node

var main_scene = "res://scene/main_scene.tscn";
var level_root_node_path = "/root/MainScene/GameRoot/LevelRoot";
var level_dic = {
	"Level1":"res://scene/level/level_1.tscn"
}



func load_main_scene():
	if get_tree().root.has_node('/root/MainScene/'):
		return;
	
	var scene_file:PackedScene = load(main_scene);
	var main_node = scene_file.instantiate();
	get_tree().root.add_child(main_node);


func load_level(level:String):
	var level_path = level_dic.get(level);
	if level_path == null:
		return;
	
	var level_scene_file : PackedScene= load(level_path);
	var level_node = level_scene_file.instantiate();
	var level_root_node = get_node(level_root_node_path);
	if level_root_node != null:
		var nodes = level_root_node.get_children();
		if nodes != null:
			for node in nodes:
				node.queue_free();
		
		await get_tree().physics_frame;
		await get_tree().physics_frame;		
		level_root_node.add_child(level_node);
	
