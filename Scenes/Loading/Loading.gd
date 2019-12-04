extends Control

export(float, EXP, 0, 100, 0.01) var percent
onready var disk_node = get_node("Disks")

var type: int = 0
signal done(type)

func _ready() -> void:
	raise()

func activate(select:int = -1):
	percent = 0
	raise()
	show()
	#get_tree().paused = true
	set_process(true)
	
	if select == -1:
		select = round(rand_range(1, 1))
	
	match select:
		0:
			disk_node.hide()
			disk_node.get_node("Animation").play("Start")
			type = 0
		1:
			disk_node.show()
			disk_node.get_node("Animation").play("Start")
			type = 1

func _process(delta):
	raise()
	disk_node.get_node("ProgressBar").value = percent
	#percent += delta * 16

func _on_animation_started(anim_name):
	pass 

func _on_Animation_animation_finished(anim_name):
	if anim_name == "Start":
		if type == 0:
			emit_signal("done", 0)
		else:
			disk_node.get_node("Animation").play("Loop")
	elif anim_name == "End":
		hide()
		#get_tree().paused = false
		percent = 0
		set_process(false)
	elif (anim_name == "Loop") and (percent >= 100):
		raise()
		emit_signal("done", 1)
		disk_node.get_node("Animation").play("End")
	elif (anim_name == "Loop") and (percent < 100):
		raise()
		disk_node.get_node("Animation").play("Loop")
		#percent += 25
	
