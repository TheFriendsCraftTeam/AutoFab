extends ColorRect

signal quitting()
signal command(command_id, command_args)

func Start():
	
	show()
	$AnimationPlayer.play("FadeIn")

func _on_TextEdit_command(type, args):
	if type == "quit":
		Quit()
	elif type == "help":
		$Label.bbcode_text.insert($Label.bbcode_text.length(), "[color=yellow]No help 4 you, sorry.")
	elif type == "unknow":
		$Label.bbcode_text.insert($Label.bbcode_text.length(), "[color=red]What?  I don't understand...")

func Quit():
	
	$AnimationPlayer.play("FadeOut")
	emit_signal("quitting")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	
	if anim_name == "FadeOut":
		hide()
		
	
