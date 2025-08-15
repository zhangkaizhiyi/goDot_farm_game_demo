# hurtCompoment的作用是被附加的物体可以检测到HitCompoment的打击
class_name HurtCompoment
extends Area2D
@export var tool = DataType.Tool.None;


signal sg_hurt(damage:int);

func _on_area_entered(area: Area2D) -> void:
	var hit_compoment = area as HitCompoment;
	if tool == hit_compoment.tool:
		sg_hurt.emit(hit_compoment.hit_damage);
