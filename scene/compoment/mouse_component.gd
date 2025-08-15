extends Node


@export var cursor_component_texture:Texture2D;

func _ready() -> void:
	# 限制鼠标是箭头Input.CURSOR_ARROW
	Input.set_custom_mouse_cursor(cursor_component_texture,Input.CURSOR_ARROW);
