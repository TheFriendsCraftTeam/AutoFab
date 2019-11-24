tool
extends EditorPlugin

func _enter_tree():
	print("GamePad is ACTIVE!!!!!!!")

func _exit_tree():
	print("GamePad is DEAD...")

func has_main_screen() -> bool:
	return true

func make_visible(visible: bool) -> void:
	pass

