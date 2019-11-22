extends Node2D

class_name HexaMouse, "res://Assets/Textures/GUI/Mouse/Hexa16x.svg"

export var moving_slowness: float = 4.0
export var animation_speed: float = 20.0
export var verticies: int = 6
export var poly_range: float = 10.0
export var color: Color
var time: float

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	position = OS.get_screen_size() / 2
	z_index = 64

func _draw() -> void:
	var points: PoolVector2Array
	var colors: PoolColorArray
	
	for vert in range(verticies * 2):
		points.append(Vector2(sin(deg2rad((360 / verticies * vert) + time)) * (poly_range / 2), cos(deg2rad((360 / verticies * vert) + time)) * (poly_range / 2)))
		colors.append(color)
	
	draw_polyline(points, color, poly_range, true)

func _process(delta: float) -> void:
	time += delta * animation_speed
	update()
	
	var mouse_coords: Vector2 = get_tree().get_root().get_mouse_position()
	position += (mouse_coords - position) / moving_slowness

