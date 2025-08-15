class_name Cow
extends CharacterBody2D

var walk_cycle:int = 1;
var current_walk_cycle:int = 0;

func _ready() -> void:
	walk_cycle = randi_range(1,5);
