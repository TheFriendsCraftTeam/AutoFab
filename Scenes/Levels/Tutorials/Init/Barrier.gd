extends Spatial




func get_player_distance() -> float:
	var player = get_tree().get_nodes_in_group("Player")[0]
	var distance = to_global(translation) - to_global(player.translation)
	return distance.length()


func _process(delta: float) -> void:
	if get_player_distance() <= 5.0:
		#Right
		if $VisibilityNotifier.is_on_screen():
			$Right/SpotLight.show()
		else:
			$Right/SpotLight.hide()
		$Right/SpotLight.light_energy = -get_player_distance() / 5.0 + 1.0
		$Right/MeshInstance.mesh.size.y = (-get_player_distance() / 5.0 + 1.0) * 2 + 0.2
		$Right.translation.y = -get_player_distance() / 5.0 + 1.0
		
		#Left
		if $VisibilityNotifier.is_on_screen():
			$Left/SpotLight.show()
		else:
			$Left/SpotLight.hide()
		$Left/SpotLight.light_energy = -get_player_distance() / 5.0 + 1.0
		$Left/MeshInstance.mesh.size.y = (-get_player_distance() / 5.0 + 1.0) * 2 + 0.2
		$Left.translation.y = -get_player_distance() / 5.0 + 1.0
