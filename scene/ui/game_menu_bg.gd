extends Node2D

func _ready() -> void:
	call_deferred("_set_process_mode");

func _set_process_mode():
	process_mode = Node.PROCESS_MODE_DISABLED;
