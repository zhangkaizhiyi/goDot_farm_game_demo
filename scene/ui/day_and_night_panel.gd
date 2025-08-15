extends Control

@onready var lb_day: Label = $VBoxContainer/DayPanel/MarginContainer/lbDay
@onready var lb_time: Label = $VBoxContainer/TimePanel/MarginContainer/lbTime

@export var normal_speed = 5;
@export var faster_speed = 100;
@export var cheater_speed = 200;


func _ready() -> void:
	DayAndNightCycleManager.sg_tick.connect(_on_tick);

func _on_tick(day:int,hour:int,minute:int):
	lb_day.text = "Day %02d" % day;
	lb_time.text = "%02d:%02d" %[hour,minute];


func _on_btn_normal_pressed() -> void:
	DayAndNightCycleManager.game_speed = normal_speed;


func _on_btn_faster_pressed() -> void:
	DayAndNightCycleManager.game_speed = faster_speed;

func _on_btn_cheater_pressed() -> void:
	DayAndNightCycleManager.game_speed = cheater_speed;
