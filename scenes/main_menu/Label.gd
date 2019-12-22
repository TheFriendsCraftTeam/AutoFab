extends Label



func _process(delta):
	var Info:Array= [ProjectSettings.get_setting("FriendsCraft/gameinfo/Version"), ProjectSettings.get_setting("FriendsCraft/gameinfo/State"), Engine.get_frames_per_second()]
	
	set_text("Version: " + Info[1] + " " + String(Info[0]) + ",    Fps: " + String(Info[2]))
	
	
