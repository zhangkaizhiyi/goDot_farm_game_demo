extends Node


var inventory:Dictionary  = Dictionary();

signal sg_inventory_change(object_name:String);

func add_object_to_inventory(object_name:String):
	if inventory.get_or_add(object_name) == null:
		inventory[object_name] = 1;
	else:
		inventory[object_name] += 1;
		
	sg_inventory_change.emit(object_name);
	
	
	
func remove_object_from_inventory(object_name:String):
	if inventory.has(object_name):
		if inventory[object_name] == 0:
			return;
		else:
			inventory[object_name] -= 1;
			sg_inventory_change.emit(object_name);
	
	
	
	
	
func get_object_num(object_name:String) -> int:
	if inventory.has(object_name):
		return inventory[object_name];
	else:
		return 0;
	
		
