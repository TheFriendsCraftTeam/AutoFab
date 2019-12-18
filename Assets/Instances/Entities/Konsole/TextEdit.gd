extends TextEdit

signal command(type, args)

func _input(event):
	
	if Input.is_action_pressed("enter") && text.begins_with(">"):
		if text.begins_with(">quit"):
			emit_signal("command", "quit", null)
		
		elif text.begins_with(">help"):
			emit_signal("command", "help", null)
		
		elif text.begins_with(">setvar"):
			
			emit_signal("command", "setvar", null)
		
		elif text.begins_with(">runfunc"):
			
			emit_signal("command", "runfunc", null)
		
		else:
			emit_signal("command", "unknow", text)
		text = String()
	