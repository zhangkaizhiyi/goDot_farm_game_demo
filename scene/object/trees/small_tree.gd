extends Sprite2D
@onready var hurt_compoment: HurtCompoment = $HurtCompoment
@onready var damage_compoment: DamageCompoment = $DamageCompoment

var log_scene = preload("res://scene/object/trees/log.tscn");


func _ready() -> void:
	hurt_compoment.sg_hurt.connect(on_hurt);
	damage_compoment.sg_max_damage_reach.connect(on_max_damage_reach);
	

func on_hurt(damage:int):
	damage_compoment.apply_damage(damage);
	material.set_shader_parameter("shake_intensity",1.0);
	await get_tree().create_timer(1.0).timeout;
	material.set_shader_parameter("shake_intensity",0.0);

func on_max_damage_reach():
	call_deferred("add_log")
	queue_free();

func add_log():
	var log = log_scene.instantiate() as Node2D;
	log.global_position = global_position;
	get_tree().root.add_child(log);
