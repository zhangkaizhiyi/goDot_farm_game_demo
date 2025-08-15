extends Node

var current_tool = DataType.Tool.None;

signal tool_selected(tool:DataType.Tool);

# 相当于写一个set，然后搞一个钩子函数出去 
func select_tool(tool:DataType.Tool):
	tool_selected.emit(tool);
	current_tool = tool;


 
 
