extends TextEdit

signal command(type, args)

func _input(event):
	
	if Input.is_action_pressed("enter") && text.begins_with(">"):
		if Commands.is_valid():
			for c in Commands.get_commands():
				if text.begins_with(">" + c):
					emit_signal("command", c, null)
		else:
			emit_signal("command", "unknow", text)
		text = String()
		