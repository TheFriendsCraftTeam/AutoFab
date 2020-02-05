extends TextEdit

signal command(type)
var com = load("res://autoloads/konsole/Commands.gd").new()

func _input(event):
	if Input.is_action_pressed("enter") && text.begins_with(">"):
		if com.is_valid(text):
			for c in com.get_commands():
				if text.begins_with(">" + c):
					emit_signal("command", c)
		else:
			emit_signal("command", "unknow", text)
		text = String()
