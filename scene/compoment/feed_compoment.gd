class_name FeedCompoment
extends Area2D


signal sg_food_received(area: Area2D);


func _on_area_entered(area: Area2D) -> void:
	sg_food_received.emit(area);
