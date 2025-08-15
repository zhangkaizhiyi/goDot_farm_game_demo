class_name TestSceneSaveDataManament
extends Node

func _ready() -> void:
	call_deferred("load_data")
	
func load_data():
	GameSaveManager.load_data();
