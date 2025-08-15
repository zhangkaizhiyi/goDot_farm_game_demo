class_name DamageCompoment
extends Node

@export var current_damage:int = 0;
@export var max_damage:int = 1;

signal sg_max_damage_reach;

func apply_damage(damage:int):
	current_damage += damage;
	if current_damage >= max_damage:
		current_damage = max_damage;
		sg_max_damage_reach.emit();
