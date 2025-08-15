class_name TimemapDataResource
extends NodeDataResource


@export var  cells:Array[Vector2i];
@export var terrain_set: int = 0; 
@export var terrain: int = 1;

func _save_data(node:Node2D):
	super._save_data(node);
	var tilemap = node as TileMapLayer;
	cells = tilemap.get_used_cells();
	print("cells",cells);
		
		
func _load_data(window:Window):
	var tile_map_node = window.get_node_or_null(node_path);
	if tile_map_node != null:
		print("load_data,cells",cells);
		var tile_map = tile_map_node as TileMapLayer;
		tile_map.set_cells_terrain_connect(cells,terrain_set,terrain,true);
	
