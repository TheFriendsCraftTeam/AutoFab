extends Control

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	


func _input(event):
	
	if Input.is_action_just_pressed("left"):
		$AnimationPlayerLeft.play("LeftSel", 0)
		
	
	if Input.is_action_just_pressed("right"):
		$AnimationPlayerRight.play("RightSel", 0)
		
	
	if Input.is_action_just_pressed("esc"):
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://MainTab/MainTab.tscn")
		
	
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("")
		
		