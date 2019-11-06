extends Control

var mouse_pos: Vector2 = Vector2()
export var slowness: float = 16.0
export var rotation_speed: float = 90.0
export var screen_adder: Vector2 = Vector2()

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	mouse_pos = get_viewport().get_mouse_position()
	rect_position = ((mouse_pos - (rect_size / 2)) - rect_position / slowness) + screen_adder
	$TextureRect.rect_rotation += rotation_speed * delta

func hoover(on: bool = true):
	if on:
		$TextureRect.texture = preload("res://Assets/Textures/GUI/Mouse/Hexa16x_hole.svg")
		$Tween.interpolate_property($TextureRect, "rect_scale", null, Vector2(2, 2), 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN)
	else:
		$TextureRect.texture = preload("res://Assets/Textures/GUI/Mouse/Hexa16x.svg")
		$Tween.interpolate_property($TextureRect, "rect_scale", null, Vector2(1, 1), 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()