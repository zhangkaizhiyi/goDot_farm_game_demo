extends Sprite2D
@onready var hurt_compoment: HurtCompoment = $HurtCompoment
@onready var damage_compoment: DamageCompoment = $DamageCompoment

var stone_scene = preload("res://scene/object/rocks/stone.tscn")

func _ready() -> void:
	damage_compoment.sg_max_damage_reach.connect(on_max_damage_reach);
	hurt_compoment.sg_hurt.connect(on_hurt);

func on_hurt(damage:int):
	damage_compoment.apply_damage(damage);
	var shader_material = material as ShaderMaterial;
	shader_material.set_shader_parameter('shake_intensity',0.4);
	await get_tree().create_timer(1.0).timeout;
	shader_material.set_shader_parameter('shake_intensity',0.0);
	
	
	
func on_max_damage_reach():
	call_deferred('add_stone');
	queue_free();

func add_stone():
	var stone = stone_scene.instantiate() as Node2D;
	stone.global_position = global_position;
	get_parent().add_child(stone);
