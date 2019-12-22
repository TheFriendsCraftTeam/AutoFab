tool
extends Control

signal Pressed()
signal Hoover(on)
signal Focus(on)

export var type:Array = [2, 2]
export var text:String = ""
export var color: Color = Color()
export var reloading:bool = false
export var click_sound: AudioStream

var left_texture:Texture
var right_texture:Texture

func _ready():
	reloading = true

func _process(delta):
	Reload(reloading)


func Reload(hard):
	$Label.text = TranslationServer.tr(text)
	if !$AudioStreamPlayer.stream == click_sound:
		$AudioStreamPlayer.stream = click_sound
	
	$BlurLeft.material.set_shader_param("modulate", color)
	$BlurRight.material.set_shader_param("modulate", color)
	$BlurCenter.material.set_shader_param("modulate", color)
	
	if hard:
		if type[0] == 1:
			left_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Left/EdgeUp.svg")
		elif type[0] == 2:
			left_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Left/EdgeCenter.svg")
		elif type[0] == 3:
			left_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Left/EdgeDown.svg")
		
		if type[1] == 1:
			right_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Right/EdgeUp.svg")
		elif type[1] == 2:
			right_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Right/EdgeCenter.svg")
		elif type[1] == 3:
			right_texture = load("res://Assets/Textures/GUI/Buttons/BlurMaskButton/Right/EdgeDown.svg")
		reloading = false
		
		$BlurLeft.material.set_shader_param("mask", left_texture)
		$BlurRight.material.set_shader_param("mask", right_texture)
		
		


func _on_Button_mouse_entered():
	var mouse = get_node("/root/Mouse")
	#mouse.hoover(true)
	$AnimationPlayer.play("HooverIn")
	#emit_signal("Hoover", true)


func _on_Button_mouse_exited():
	var mouse = get_node("/root/Mouse")
	#mouse.hoover(false)
	$AnimationPlayer.play("HooverOut")
	#emit_signal("Hoover", false)


func _on_Button_pressed():
	emit_signal("Pressed")
	$AudioStreamPlayer.play()
