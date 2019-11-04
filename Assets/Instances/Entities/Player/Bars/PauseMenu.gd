extends Control

var done = false

func _on_PauseMenu_visibility_changed():
	if visible:
		$AnimationPlayer.play("FadeIn")
		done = true
	elif done:
		show()
		$AnimationPlayer.play("FadeOut")

func _input(event):
	if Input.is_action_just_pressed("jump") and visible == true:
		get_tree().quit()
		
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		done = false
		hide()