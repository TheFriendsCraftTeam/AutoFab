extends Node

onready var cube = $"3D/Cube"
onready var cam = $"3D/Camera"
onready var camcam = $"3D/Camera/Camera"

export var selected:bool = false
export var rotation_speed:float = 1.0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if selected:
		cube.rotate_x(rotation_speed * delta)
		cube.rotate_y(rotation_speed * delta)
		cube.rotate_z(rotation_speed * delta)
	
	cam.rotation = Vector3(0, (get_viewport().get_mouse_position().x / get_viewport().get_visible_rect().size.x) - 0.25, 0)
	camcam.rotation = Vector3(((get_viewport().get_mouse_position().y / get_viewport().get_visible_rect().size.y) / 2), 0,0)
	
	#print(cam.rotation.y, "  ", camcam.rotation.x)
	
	
