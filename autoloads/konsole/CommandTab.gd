extends VBoxContainer

signal run(cname, args)
export var command_name: String
export var args: Dictionary


func compile() -> void:
	for prop in args.keys():
		var cont = HBoxContainer.new()
		var lab = Label.new()
		var mod
		
		if args.get(prop) is String:
			mod = LineEdit.new()
			mod.expand_to_text_length = true
		elif args.get(prop) is bool:
			mod = CheckButton.new()
		elif args.get(prop) is int:
			mod = SpinBox.new()
		elif args.get(prop) is float:
			mod = SpinBox.new()
		else:
			mod = Button.new()
			mod.text = "Error"
			mod.disabled = true
		
		lab.text = prop.capitalize()
		cont.name = prop.capitalize()
		add_child(cont)
		cont.add_child(lab)
		cont.add_child(mod)


func _on_Quit_pressed() -> void:
	get_parent().hide()


func _on_Run_pressed() -> void:
	emit_signal("run", args)
	get_parent().hide()
