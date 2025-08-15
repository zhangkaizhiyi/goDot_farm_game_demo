extends Node

const MINUTES_PER_DAY = 24 * 60;
const MINUTES_PER_HOUR = 60;
# 一分钟走这么多弧度
const GAME_MINUTE_DURATION:float = TAU / MINUTES_PER_DAY;


var initial_day:int = 0;
var initial_hour:int = 0;
var initial_minute:int = 0;

var game_speed:float = 1.0;
var time:float = 0.0; # 游戏前进了多少弧度
var current_minute = -1;
var current_day = 0;

signal sg_game_time(time:float);
signal sg_tick(day:int,hour:int,minute:int);
signal sg_tick_day(day:int);


func _ready() -> void:
	_set_initial_time();

# time本来是一个一秒5的int，现在变成了1秒5弧度，
func _process(delta: float) -> void:
	time += delta * game_speed * GAME_MINUTE_DURATION;
	sg_game_time.emit(time);
	_calculate_time();
	
func _set_initial_time():
	var initial_total_minutes = initial_day * MINUTES_PER_DAY + initial_hour * MINUTES_PER_HOUR + initial_minute;
	time = initial_total_minutes * GAME_MINUTE_DURATION;
	
	
func _calculate_time():
	var total_minutes = int(time / GAME_MINUTE_DURATION);
	var day:int = int(total_minutes / MINUTES_PER_DAY);
	var minutes_left = int(total_minutes % MINUTES_PER_DAY);
	var hour = int(minutes_left / MINUTES_PER_HOUR);
	var minute = int(minutes_left % MINUTES_PER_HOUR);
	
	if current_minute != minute:
		current_minute = minute;
		sg_tick.emit(day,hour,minute);
	if current_day != day:
		print("total_minutes",total_minutes);
		current_day = day;
		sg_tick_day.emit(day);
	
	
