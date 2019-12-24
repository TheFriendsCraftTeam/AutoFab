extends GDScript
class_name Commands

var list: Dictionary = {
	"quit": null,
	"help": null,
	"getvar": {"path": NodePath()},
	"setvar": {"path": NodePath(), "value": null},
	"run": {"path": NodePath(), "func_name": "", "values": []}
}

func is_valid(command: String) -> bool:
	return list.has(command)

func get_commands() -> Array:
	return list.keys()