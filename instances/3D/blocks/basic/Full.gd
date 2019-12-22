extends StaticBody

#Vars
export var state: int = normal

const deleted: int = 0
const normal: int = 1

func _on_Placed(face, block):
	
	if block != null:
		var BlockPath:String = "res://Assets/Instances/Blocks/" + String(block) + ".tscn"
		var BlockNode = load(BlockPath).instance()
		add_child(BlockNode)
		if face == 1:#Up(+y)
			BlockNode.transform = BlockNode.transform.translated(Vector3(0, 0.5, 0))
			
		elif face == 2:#Down(-y)
			BlockNode.transform = BlockNode.transform.translated(Vector3(0, -0.5, 0))
			
		elif face == 3:#Forward(-z)
			BlockNode.transform = BlockNode.transform.translated(Vector3(0, 0,-0.5))
			
		elif face == 4:#Backward(+z)
			BlockNode.transform = BlockNode.transform.translated(Vector3(0, 0, 0.5))
			
		elif face == 5:#Left(-x)
			BlockNode.transform = BlockNode.transform.translated(Vector3(-0.5, 0, 0))
			
		elif face == 6:#Right(+x)
			BlockNode.transform = BlockNode.transform.translated(Vector3(0.5, 0, 0))
			
		print("Created Block at coords: " + String(BlockNode.global_transform.origin))
	else:
		print("Deleting Block at coords: " + String(translation))
		state = deleted
		for i in get_child_count():
			var children: Array = get_children()
			if children[i].is_in_group("Face"):
				children[i].get_node("CollisionShape").disabled = true
				children[i].Hide()
			
		$Visible.hide()
