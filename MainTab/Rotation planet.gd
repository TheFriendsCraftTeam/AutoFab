extends Spatial

export var min_planet_speed = 0.1
export var max_planet_speed = 2

export var min_planet_rot_speed = 0
export var max_planet_rot_speed = 10
export var rotation_axis = Vector3()

var planet_speed:float = 0.0
var planet_rot = Vector3()
var planet_rotation_speed:float = 0.0
var x_rot:float = 0.0
var y_rot:float = 0.0
var z_rot:float = 0.0

func _ready():
	
	planet_rotation_speed = rand_range(min_planet_rot_speed, max_planet_rot_speed)
	for i in range(3):
		rotation_axis[i] = rand_range(0, 1)
	
	planet_speed = rand_range(min_planet_speed, max_planet_speed)
	planet_rot = Vector3(rand_range(360, 0), rand_range(360, 0), rand_range(360, 0))
	$Planet.rotation = planet_rot
	
	x_rot = rotation_axis[0]
	y_rot = rotation_axis[1]
	z_rot = rotation_axis[2]
	
	#print(get_name(), ":   Random rotation speed:   ", planet_speed, ", Random planet rotation:   ", planet_rot, ", Enabled axis:   ", rotation_axis)

func _process(delta):
	rotate_y(planet_speed * delta)
	
	$Planet.rotate_x(x_rot * delta)
	$Planet.rotate_y(y_rot * delta)
	$Planet.rotate_z(z_rot * delta)

