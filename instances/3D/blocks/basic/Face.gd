extends Area

signal Placed(face, block)
export var face_id:int = 0
export var selected: bool = false
var state: int = IDLE
const IDLE = 1
const NOTED = 2
const HIDED = 0
onready var holo = get_node("Holo")


func Update() -> void:
	if selected and state == IDLE:
		Show()
		state = NOTED
		
	elif !selected and state == NOTED:
		Hide()
		state = IDLE
		
	

func Show():
	show()
	$AnimationPlayer.play("Fade")
	

func Hide():
	$AnimationPlayer.play("Fade Out")
	

func Place(block: String) -> void:
	if state == NOTED:
		state = HIDED
		emit_signal("Placed", face_id, block)
		$CollisionShape.disabled = true
		Hide()
		
	

func Destroy():
	emit_signal("Placed", 0, null)
	

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "Fade Out":
		hide()
	
