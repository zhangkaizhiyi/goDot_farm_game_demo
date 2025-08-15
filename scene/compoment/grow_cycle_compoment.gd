class_name GrowCycleCompoment
extends Node


@export var current_grow_state = DataType.GrowState.Germination; # 发芽阶段
@export_range(5,300) var harvest_day = 7;# 
signal sg_harvest;# 收获了
signal sg_maturity; # 成熟了
var start_day:int = 0; # 初始天数
var is_watered:bool= false;

func _ready() -> void:
	DayAndNightCycleManager.sg_tick_day.connect(on_tick_day);

# 浇水的第二天才会触发
func on_tick_day(day:int):
	if is_watered:
		if start_day == 0:
			start_day = day;
		calculate_maturity_state(start_day,day);
		calculate_harvest_state(start_day,day);
	

func calculate_maturity_state(start_day:int,current_day:int):
	if current_grow_state == DataType.GrowState.Maturity:
		return;
	
	var state_index = current_day - start_day + 1;
	current_grow_state = state_index;
	print("start_day",start_day);
	print("current_day",current_day);
	print("当前阶段：",DataType.GrowState.keys()[state_index]);
	if current_grow_state == DataType.GrowState.Maturity:
		sg_maturity.emit();
	
	
func calculate_harvest_state(start_day:int,current_day:int):
	if current_grow_state == DataType.GrowState.Harvesting:
		return;
	
	var grow_day =  current_day - start_day + 1;
	if grow_day == harvest_day:
		current_grow_state = DataType.GrowState.Harvesting;
		 
		sg_harvest.emit();
		

		
	
	
