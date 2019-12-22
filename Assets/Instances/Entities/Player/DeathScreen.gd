extends Control

signal died()

func die(cause: String, agents: PoolStringArray = []) -> void:
	Engine.set_time_scale(0.5)
	$Text.bbcode_text = "[center][color=red]%s[/color]" % TranslationServer.tr("PLAYER_DEATH")
	$Text/Description.text = "[center][color=#ff8800]" + TranslationServer.tr(cause) % agents
	$Animation.play("Death")

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Death":
		emit_signal("died")
		Engine.set_time_scale(1.0)
