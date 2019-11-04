extends TextEdit

signal command(type, args)

func _input(event):
	
	if Input.is_action_pressed("enter") && text.begins_with(">"):
		if text.begins_with(">quit"):
			emit_signal("command", "quit", null)
		
		if text.begins_with(">help"):
			emit_signal("command", "help", null)
		
		if text.begins_with(">setvar"):
			
			emit_signal("command", "setvar", null)
		
		else:
			emit_signal("command", "unknow", text)
		text = String()
	