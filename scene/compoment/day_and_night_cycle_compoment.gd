class_name DayAndNightCycleCompoment
extends CanvasModulate

@export var day_night_gradient_texture:GradientTexture1D


@export var initial_day:int = 0:
	set(_initial_day):
		initial_day = _initial_day;
		DayAndNightCycleManager.initial_day = initial_day;
		DayAndNightCycleManager._set_initial_time();
		
@export var initial_hour:int = 0:
	set(_initial_hour):
		initial_hour = _initial_hour;
		DayAndNightCycleManager.initial_hour = initial_hour;
		DayAndNightCycleManager._set_initial_time();

@export var initial_miture:int = 0:
	set(_initial_minute):
		initial_miture = _initial_minute;
		DayAndNightCycleManager.initial_minute = initial_miture;
		DayAndNightCycleManager._set_initial_time();


func _ready() -> void:
	DayAndNightCycleManager.initial_day = initial_day;
	DayAndNightCycleManager.initial_hour = initial_hour;
	DayAndNightCycleManager.initial_minute = initial_miture;
	DayAndNightCycleManager._set_initial_time();
	
	
	DayAndNightCycleManager.sg_game_time.connect(_on_game_time);


func _on_game_time(time:float):
	# 12点是0，
	var param = 0.5 * (sin(time - PI / 2) + 1.0);
	color = day_night_gradient_texture.gradient.sample(param);
