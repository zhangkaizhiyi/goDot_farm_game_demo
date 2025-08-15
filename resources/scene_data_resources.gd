class_name SceneDataResources
extends NodeDataResource

@export var node_name:String;
@export var scene_file_path:String;


# 调用这个方法的会是Corn
func _save_data(node:Node2D):
	super._save_data(node);
	node_name = node.name;
	scene_file_path = node.scene_file_path;
	
func _load_data(window:Window):
	var parent_node:Node2D;
	var scene_node:Node2D;
	
	if parent_node_path != null:
		parent_node = window.get_node_or_null(parent_node_path);
		
	if node_path != null:
		var scene_file_resource:PackedScene = load(scene_file_path);
		scene_node = scene_file_resource.instantiate() as Node2D;
	
	
	if parent_node != null and scene_node != null:
		scene_node.global_position = global_position;
		parent_node.add_child(scene_node); 
	
