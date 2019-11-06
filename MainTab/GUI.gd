extends Control

signal main_to_play()#Some custom signals
signal main_to_options()

func _process(delta: float) -> void:
	$Mouse.screen_adder = get_node("../2D/Camera").offset + Vector2(1920, 0)

func _on_Play_Pressed():
	emit_signal("main_to_play")
	$Info.align = Label.ALIGN_RIGHT

func _on_Options_Pressed():
	emit_signal("main_to_options")
	$Info.align = Label.ALIGN_LEFT

func _on_PlayREALLY_pressed():
	print("Fading to level selection...")
	$SceneFader.play("Play")

func _on_Return_2_Main_pressed():
	emit_signal("main_to_play")
	$Info.align = Label.ALIGN_CENTER

func _on_Level_Options_pressed():
	print("No level here...")

func _on_Quit_Pressed():
	print("Quitting...")
	$SceneFader.play("Quit")

func _on_Options_2_Main_Pressed():
	emit_signal("main_to_options")
	$Info.align = Label.ALIGN_CENTER

func _on_SceneFader_animation_finished(anim_name: String) -> void:
	if anim_name == "Quit":
		print("Animation finished!!!")
		get_tree().quit()
	elif anim_name == "Play":
		print("Changing scene...")
		get_tree().change_scene("res://Scenes/Levels/LevelSelection.tscn")


