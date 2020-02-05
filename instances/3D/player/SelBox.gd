extends MeshInstance

var dest_pos: Vector3
var dest_scale: Vector3
var focus: bool = true
var w_focus: bool = focus
var object: Spatial

func _process(delta: float) -> void:
	translation += (get_parent().to_local(dest_pos) - translation)# * 0.2
#	if w_focus != focus:
#		if focus:
#			pass
#		else:
#			pass
#
	if focus:
		rotate(Vector3(1, 1, 1), delta * 2)