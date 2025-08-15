extends Node

# 游戏里按按键就会触发组件的方法
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action('save_data'):
		save_data();




func save_data():
	var level_component:SaveLevelDataComponent = get_tree().get_first_node_in_group('save_level_data_component');
	level_component.save_game();


func load_data():
	var level_component:SaveLevelDataComponent = get_tree().get_first_node_in_group('save_level_data_component');
	level_component.load_game();
