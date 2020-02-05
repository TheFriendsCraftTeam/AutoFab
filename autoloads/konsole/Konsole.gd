extends ColorRect

signal quitting()
signal command(command_id, command_args)
var ex_mouse_mode

func _ready() -> void:
	hide()
	raise()


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("console"):
		Start()


func Start():
	get_tree().paused = true
	ex_mouse_mode = Input.get_mouse_mode()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	raise()
	show()
	$TextEdit.grab_focus()


func new_tab(type: String):
	var tab = load("res://autoloads/konsole/CommandTab.tscn").instance()
	var coms = load("res://autoloads/konsole/Commands.gd").new()
	
	tab.name = type
	tab.args = coms.list.get(type)
	$CommandCompiler.add_child(tab)
	tab.compile()
	$CommandCompiler.show()


func _on_command(type):
	$TextEdit.grab_focus()
	if type == "quit":
		Quit()
	elif type == "help":
		$Label.add_line("[color=yellow]No help 4 you, sorry.")
	elif type == "var":
		new_tab("var")
	elif type == "run":
		new_tab("run")
	elif type == "unknow":
		$Label.add_line("[color=red]What?  I don't understand...")


func Quit():
	hide()
	get_tree().paused = false
	Input.set_mouse_mode(ex_mouse_mode)
