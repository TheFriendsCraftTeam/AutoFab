extends Node



func _process(delta: float) -> void:
	$Spatial/RedCross.rotate_x(deg2rad(22.5) * delta)
	$Spatial/RedCross.rotate_y(deg2rad(22.5) * delta)
	$Spatial/RedCross.rotate_z(deg2rad(22.5) * delta)
	

