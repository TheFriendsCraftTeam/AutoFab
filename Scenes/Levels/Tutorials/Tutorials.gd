extends Node

var all_nodes = 8
var nodes = 1

func _ready():
	pass # Replace with function body.

func loading_up(value:float):
	nodes = min(all_nodes, nodes + value)
	#$ChoosingRoom/Loading.percent = (nodes * 100) / all_nodes

func _on_ready(extra_arg_0):
	loading_up(extra_arg_0)
