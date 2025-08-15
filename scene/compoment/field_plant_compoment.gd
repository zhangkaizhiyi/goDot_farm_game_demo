class_name FieldPlantCompoment
extends Node


@export var field_tilemap:TileMapLayer;
var player:Player;

@export var terrain_set:int = 0;
@export var terrain:int = 1;


var mouse_positon:Vector2;
var cell_positon:Vector2i; # 格子坐标
var cell_source_id:int; # 判断这个地方是否有grass
var local_cell_positon:Vector2;
var distance:float;

var corn_scene = preload('res://scene/object/corn/corn.tscn');
var tomato_scene = preload('res://scene/object/tomato/tomato.tscn')


func _ready() -> void:
	await get_tree().physics_frame;
	await get_tree().physics_frame;
	player = get_tree().get_first_node_in_group('player');


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('remove_field'):
		if ToolManager.current_tool == DataType.Tool.TillGround:
			update_position();
			remove_plant();
	elif event.is_action_pressed("hit"):
		print("mouse_postion",event.position);
		if ToolManager.current_tool == DataType.Tool.PlantCorn or ToolManager.current_tool == DataType.Tool.PlantTomato:
			update_position();
			add_plant();
			
			
func update_position():
	# 鼠标坐标
	mouse_positon = field_tilemap.get_local_mouse_position();
	# 格子
	cell_positon = field_tilemap.local_to_map(mouse_positon);
	# 格子是否合法
	cell_source_id = field_tilemap.get_cell_source_id(cell_positon);
	# 格子坐标
	local_cell_positon = field_tilemap.map_to_local(cell_positon);
	
	print("local_cell_positon",local_cell_positon);
	distance = player.global_position.distance_to(local_cell_positon);
	
	
# 种地只需要坐标，格子坐标的坐标			
func add_plant():
	if distance < 20.0 and cell_source_id != -1:
		if ToolManager.current_tool == DataType.Tool.PlantCorn:
			var corn = corn_scene.instantiate() as Node2D;
			corn.global_position = local_cell_positon;
			get_parent().find_child('Plants').add_child(corn);
		if ToolManager.current_tool == DataType.Tool.PlantTomato:
			var tomato = tomato_scene.instantiate() as Node2D;
			tomato.global_position = local_cell_positon;
			get_parent().find_child('Plants').add_child(tomato);
		

func remove_plant():
	if distance < 20.0 :
		var plant_nodes = get_parent().find_child('Plants').get_children();
		for node:Node2D in plant_nodes:
			if node.global_position == local_cell_positon:
				node.queue_free();
