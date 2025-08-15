class_name InterectionCompoment
extends Area2D


signal interable_activated;
signal interable_deactivated;

# 这个组件是 因为他也需要检测玩家，
func _on_body_entered(body: Node2D) -> void:
	interable_activated.emit();


func _on_body_exited(body: Node2D) -> void:
	interable_deactivated.emit();
