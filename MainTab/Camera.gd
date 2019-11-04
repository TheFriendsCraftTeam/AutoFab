extends Camera2D

var now = MAIN
const MAIN = 0
const PLAY = 1
const OPTIONS = 2

func _on_GUI_main_to_options():
	if now == MAIN:
		now = OPTIONS
		$AnimationPlayer.play("Options")
	elif now == OPTIONS:
		now = MAIN
		$AnimationPlayer.play_backwards("Options")
	else:
		pass#	Not my problem!!


func _on_GUI_main_to_play():
	if now == MAIN:
		now = PLAY
		$AnimationPlayer.play("Play")
	elif now == PLAY:
		now = MAIN
		$AnimationPlayer.play_backwards("Play")
	else:
		pass#	Not my problem!!
