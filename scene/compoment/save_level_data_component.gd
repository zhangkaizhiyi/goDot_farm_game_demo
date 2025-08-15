class_name SaveLevelDataComponent
extends Node

var level_scene_name: String
var save_file_name: String = "save_%s_game_data.tres"
var save_game_data_path: String = ""
var game_data_resource: SaveGameDataResource


func _ready() -> void:
	add_to_group("save_level_data_component")
	level_scene_name = get_parent().name

func save_node_data() -> void:
	var nodes = get_tree().get_nodes_in_group("save_data_component")
	game_data_resource = SaveGameDataResource.new()
	
	if nodes != null:
		for node: SaveDataComponent in nodes:
			# 调用的是corn的Resource的 save
			var save_data_resource: NodeDataResource = node._save_data()
			# 都是引用赋值
			var save_final_resource = save_data_resource.duplicate()
			game_data_resource.save_data_nodes.append(save_final_resource)

# 点击保存游戏会调用这里
func save_game() -> void:
	if !DirAccess.dir_exists_absolute(save_game_data_path):
		DirAccess.make_dir_absolute(save_game_data_path)
	
	var level_save_file_name: String = save_file_name % level_scene_name
	
	save_node_data()
	
	print("Saving to path: ", ProjectSettings.globalize_path(save_game_data_path + level_save_file_name))
	# 把一个resource 保存
	var result: int = ResourceSaver.save(game_data_resource, save_game_data_path + level_save_file_name)
	print("save result:", result)

func load_game() -> void:
	var level_save_file_name: String = save_file_name % level_scene_name
	var save_game_path: String = save_game_data_path + level_save_file_name
	
	if !FileAccess.file_exists(save_game_path):
		return
	
	game_data_resource = ResourceLoader.load(save_game_path)
	
	if game_data_resource == null:
		return
	
	var root_node: Window = get_tree().root
	
	for resource in game_data_resource.save_data_nodes:
		resource._load_data(root_node)
