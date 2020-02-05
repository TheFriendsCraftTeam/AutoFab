extends GDScript
class_name Commands

var list: Dictionary = {
	"quit": null,
	"help": null,
	"var": {"path": "", "value": null},
	"run": {"path": "", "func_name": "", "values": []}
}

func is_valid(command: String) -> bool:
	for com in get_commands():
		if ">" + com == command:
			return true
	return false

func get_commands() -> Array:
	return list.keys()