extends Area2D

@export var collected_name = "unkown";

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("collect:",collected_name);
		InventoryManager.add_object_to_inventory(collected_name);
		get_parent().queue_free();






func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
