extends Node2D
@onready var hurt_compoment: HurtCompoment = $HurtCompoment
@onready var grow_cycle_compoment: GrowCycleCompoment = $GrowCycleCompoment
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles_2d: GPUParticles2D = $WateringParticles2D

var corn_harvest_scene = preload("res://scene/object/corn/corn_harvest.tscn")

func _ready() -> void:
	watering_particles_2d.emitting = false;
	hurt_compoment.sg_hurt.connect(on_hurt);
	grow_cycle_compoment.sg_harvest.connect(on_harvest);
	grow_cycle_compoment.sg_maturity.connect(on_maturity);
	
# 
func _process(delta: float) -> void:
	sprite_2d.frame = grow_cycle_compoment.current_grow_state;
	

func on_hurt(damage:int):
	print("检测到浇水");
	if !grow_cycle_compoment.is_watered:
		watering_particles_2d.emitting = true;
		await  get_tree().create_timer(5.0).timeout;
		watering_particles_2d.emitting = false;
		grow_cycle_compoment.is_watered = true;


# 收获了
func on_harvest():
	var corn_harvest = corn_harvest_scene.instantiate() as Node2D;
	corn_harvest.global_position = global_position;
	get_parent().add_child(corn_harvest);
	queue_free();


func on_maturity():
	pass;
