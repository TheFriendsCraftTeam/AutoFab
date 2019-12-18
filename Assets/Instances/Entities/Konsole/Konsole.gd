extends ColorRect

signal quitting()
signal command(command_id, command_args)

func _ready() -> void:
	hide()
	raise()

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("console"):
		Start()

func Start():
	get_tree().paused = true
	raise()
	show()
	$TextEdit.grab_focus()

func _on_TextEdit_command(type, args):
	$TextEdit.grab_focus()
	if type == "quit":
		Quit()
	elif type == "help":
		$Label.add_line("[color=yellow]No help 4 you, sorry.")
	elif type == "unknow":
		$Label.add_line("[color=red]What?  I don't understand...")

func Quit():
	hide()
	get_tree().paused = false
