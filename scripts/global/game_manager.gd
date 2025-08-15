extends Node

var menu_scene_path = "res://scene/ui/game_menu_screen.tscn";


func start_game():
	SceneManager.load_main_scene();
	await SceneManager.load_level('Level1');
	
func exit_game():
	get_tree().quit();
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('game_menu'):
		var menu_scene_file : PackedScene = load(menu_scene_path);
		var menu_scene_node = menu_scene_file.instantiate();
		get_tree().root.add_child(menu_scene_node);
