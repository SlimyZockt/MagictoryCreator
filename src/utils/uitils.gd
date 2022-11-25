extends Node
class_name Utils

static func create_2d_array(width: int, height: int, value) -> Array:
	var a = []

	for y in range(height):
		a.append([])
		a[y].resize(width)

		for x in range(width):
			a[y][x] = value

	return a

static func get_2d_array_neighbours(pos: Vector2, array: Array):
	var offset = [[Vector2(-1, -1), Vector2(-1, 0), Vector2(-1, 1)], 
				[Vector2(0, -1), Vector2(0,0), Vector2(0, 1)], 
				[Vector2(1, -1), Vector2(1, 0), Vector2(1, 1)]]
	
	var new_arr: Array = create_2d_array(3, 3, null)
	
	for y in range(offset.size()):
		for x in range(offset[0].size()):
			var new_pos = pos + offset[y][x]
			if range(array.size()).has(int(new_pos.y)) and range(array[0].size()).has(int(new_pos.x)):
				new_arr[y][x] = array[new_pos.y][new_pos.x]
	
	return new_arr

static func is_within_bounds(width, height, x, y):
	return 0 < x and x <= width and 0 < y and y <= height

static func divmod(dividend: int, divisor: int) -> Vector2:
	return Vector2(dividend / divisor, dividend % divisor)
	
static func instance_node(node: PackedScene, parent: Node) -> Node:
	var node_inst := node.instantiate()
	parent.add_child(node_inst)
	return node_inst

static func instance_node_at_location(node: PackedScene, parent: Node, location: Vector2) -> Node:
	var node_inst: Node2D = instance_node(node, parent)
	node_inst.global_position = location
	return node_inst

static func has_overlappping_area(area: Area2D, group := "") -> bool:
	for a in area.get_overlapping_areas():
		if a.is_in_group(group):
			return true
	return false

static func generate_random_color(mix = null) -> Color:
	randomize()
	var red := randf()
	var green := randf();
	var blue := randf();

	# mix the color
	if (mix != null):
		red = (red + mix.r) / 2;
		green = (green + mix.g) / 2;
		blue = (blue + mix.b) / 2;

	var color := Color(red, green, blue);
	return color
