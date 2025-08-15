extends CanvasLayer


func _on_btn_exit_pressed() -> void:
	GameManager.exit_game();


func _on_btn_save_pressed() -> void:
	GameSaveManager.save_data();


func _on_btn_start_pressed() -> void:
	await GameManager.start_game();
	GameSaveManager.load_data();
	queue_free();
	
	
	
