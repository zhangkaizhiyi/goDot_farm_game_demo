class_name Chicken
extends CharacterBody2D

var current_walk_cycle = 0;
var walk_cycle = 0;


func _ready() -> void:
	walk_cycle = randi_range(1,3)
