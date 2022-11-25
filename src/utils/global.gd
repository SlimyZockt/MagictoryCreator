extends Node

var current_scene


func switch_scene(scene: PackedScene) -> Node:
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	current_scene = scene.instantiate()
	get_tree().root.get_node("/root/Main").add_child(current_scene)
	return current_scene
