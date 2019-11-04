extends Control

signal dead()

var Life:int = 128
var MaxLife:int = 128
var dead:bool = false
var timer:float = 10.0

func _ready():
	Show(40)

func Heal(value:int):
	Show()
	Life += value
	

func Hurt(value:int):
	Show()
	Life -= value
	

func set_max_life(value:int):
	MaxLife = value
	

func get_life():
	return Life
	

func Show(timer:float = 10):
	show()
	$AnimationPlayer.play("Fade_In")
	$Timer.wait_time = timer
	$Timer.start()
	

func _process(delta):
	if Life < 0:
		Life = 0
		dead = true
		emit_signal("dead")
	elif Life == 0:
		dead = true
		emit_signal("dead")
	
	$Bar.value = Life
	$Bar.max_value = MaxLife
	

func _on_Timer_timeout():
	$AnimationPlayer.play("Fade_Out")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade_Out":
		hide()
