extends Control

signal main_to_play()#Some custom signals
signal main_to_options()


func _on_Play_Pressed():
	emit_signal("main_to_play")
	$TabFader.play("Play")
	$Info.align = Label.ALIGN_RIGHT

func _on_Options_Pressed():
	$TabFader.play("Options")
	emit_signal("main_to_options")
	$Info.align = Label.ALIGN_LEFT

func _on_PlayREALLY_pressed():
	print("Fading to level selection...")
	get_node("/root/Loading").activate(1)
	
	var lev = load("res://Scenes/Levels/LevelSelection.tscn")
	get_node("/root/Loading").percent = 20
	get_tree().change_scene_to(lev)


func _on_Return_2_Main_pressed():
	$TabFader.play_backwards("Play")
	emit_signal("main_to_play")
	$Info.align = Label.ALIGN_CENTER

func _on_Level_Options_pressed():
	print("No level here...")

func _on_Quit_Pressed():
	print("Quitting...")
	get_node("/root/Loading").activate(0)
	get_tree().quit()

func _on_Options_2_Main_Pressed():
	$TabFader.play_backwards("Options")
	emit_signal("main_to_options")
	$Info.align = Label.ALIGN_CENTER

func animation_finished(tag: int) -> void:
	if tag == 0:
		print("Animation finished!!!")
		get_tree().quit()
	elif tag == 1:
		print("Changing scene...")
		get_tree().change_scene("res://Scenes/Levels/LevelSelection.tscn")


