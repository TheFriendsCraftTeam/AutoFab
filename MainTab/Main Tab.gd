extends Node

export var user: Dictionary = {
	"name": "",
	"password": "",
	"type": 0
}



func _ready() -> void:
	if OS.get_cmdline_args()[1] == "deblog":
		user.type = 1
		user.name = OS.get_cmdline_args()[2]
		print("Welcome back " + user.name + "!!!")
	if OS.get_cmdline_args()[1] == "guest":
		user.type = 2
		user.name = OS.get_cmdline_args()[2]
	if OS.get_cmdline_args()[1] == "offlog":
		user.type = 3
		user.name = OS.get_cmdline_args()[2]
		user.password = OS.get_cmdline_args()[3]
	if OS.get_cmdline_args()[1] == "onlog":
		user.type = 4
		user.name = OS.get_cmdline_args()[2]
		user.password = OS.get_cmdline_args()[3]
		print("WTF???!!!!! [not implemented yet...]")
		get_tree().quit()
	ProjectSettings.set("FriendsCraft/user/Type", user.type)
	ProjectSettings.set("FriendsCraft/user/Username", user.name)
	ProjectSettings.set("FriendsCraft/user/Password", user.password)

