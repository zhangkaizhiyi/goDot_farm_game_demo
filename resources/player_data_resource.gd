class_name PlayerDataResource
extends NodeDataResource

@export var facing_direction:Vector2;

func _save_data(node:Node2D):
	super._save_data(node);
	var player = node as Player;
	if player != null:
		facing_direction = player.facing_direction;
	
	
	
func _load_data(window:Window):
	var player = window.get_node_or_null(node_path) as Player;
	if player != null:
		player.global_position = global_position;
		player.facing_direction = facing_direction;
