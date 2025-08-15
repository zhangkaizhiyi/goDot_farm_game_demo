class_name FieldCompoment
extends Node

@export var grass_tilemap:TileMapLayer;
@export var field_tilemap:TileMapLayer;
var player:Player;

@export var terrain_set:int = 0;
@export var terrain:int = 1;


var mouse_positon:Vector2;
var cell_positon:Vector2i; # 格子坐标
var cell_source_id:int; # 判断这个地方是否有grass
var local_cell_positon:Vector2;
var distance:float;

func _ready() -> void:
	await get_tree().physics_frame;
	await get_tree().physics_frame;
	player = get_tree().get_first_node_in_group('player');


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('remove_field'):
		if ToolManager.current_tool == DataType.Tool.TillGround:
			update_position();
			remove_tilled_field();
	elif event.is_action_pressed("hit"):
		if ToolManager.current_tool == DataType.Tool.TillGround:
			update_position();
			add_tilled_field();
			
			
func update_position():
	# 鼠标相对于草地的原点的坐标
	mouse_positon = grass_tilemap.get_local_mouse_position();
	# 返回在tileMap上的第几个格子
	cell_positon = grass_tilemap.local_to_map(mouse_positon);
	# 判断这个位置是否有瓦片
	cell_source_id = grass_tilemap.get_cell_source_id(cell_positon);
	# 格子坐标转为局部坐标
	local_cell_positon = grass_tilemap.map_to_local(cell_positon);
	
	distance = player.global_position.distance_to(local_cell_positon);
	
	print("mouse_positon:",mouse_positon,"cell_positon",cell_positon,"cell_source_id",cell_source_id);
	print("local_cell_positon",local_cell_positon,"distance",distance)
	
				
func add_tilled_field():
	if distance < 20.0 && cell_source_id != -1:
		field_tilemap.set_cells_terrain_connect([cell_positon],terrain_set,terrain,true);
		

func remove_tilled_field():
	if distance < 20.0 :
		field_tilemap.set_cells_terrain_connect([cell_positon],terrain_set,-1,true);
