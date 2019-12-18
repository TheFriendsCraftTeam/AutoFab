extends Control

var player_state = NORMAL
const NORMAL = 0
const PAUSED = 1
const HACKING = 2

func _input(event):
	if event.is_action_pressed("esc"):#if esc is pressed..
		if player_state == NORMAL:#..and the player is not in pause..
			player_state = PAUSED
			get_tree().paused = true#pause the game
			$PauseMenu.show()#show the pause menu
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)#set the mouse visible
			
			$Life.hide()#hide the bars
			
		elif player_state == PAUSED:#..else if the player is in pause 
			player_state = NORMAL
			get_tree().paused = false#continue palying
			$PauseMenu.hide()#hide the pause menu
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)#"capture" the mouse movements
			
			$Life.show()#show the bars
			$Stamina.show()
			
	
	if event.is_action_pressed("console"):#if the player call the console..
		if player_state == NORMAL:#..and it's playing:
			player_state = HACKING
			get_tree().paused = true#pause the game
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)#set the mouse "free"
			$Konsole.Start()
			
			$Life.hide()#hide the bars
			$Stamina.hide()
			
		elif player_state == PAUSED:
			player_state = HACKING
			$PauseMenu.hide()
			
			$Konsole.Start()
			
	

func _on_Button_pressed():
	get_tree().quit()

func _on_Esc_pressed():
	Input.action_press("esc")


func _on_Konsole_command(command_id, command_args):
	pass # Replace with function body.


func _on_Konsole_quitting():
	player_state = NORMAL
	$Life.Show(2)
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
