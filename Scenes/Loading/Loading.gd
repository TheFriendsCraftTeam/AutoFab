extends Control

export var percent = 0.0

signal done()

func _ready():
	var select = floor(rand_range(0, 1))
	
	if select == 0 or select == 1:
		$Disks.show()
		
	

func _process(delta):
	$Disks/ProgressBar.value = percent
	

func _on_animation_started(anim_name):
	pass 


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Loop" and percent == 100:
		$Disks/Animation.play("End")
		
	elif anim_name == "End":
		hide()
		get_tree().queue_delete(self)
		
	elif anim_name == "Loop" and percent < 100:
		$Disks/Animation.play("Loop")
		
	
