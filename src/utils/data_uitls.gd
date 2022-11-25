extends Node

static func get_item_texture(item_index: String) -> Texture2D:
	var item_name = item_index_to_name(item_index)
	var texture_path = str("res://assets/texture/items/", item_name, ".png")
	if FileAccess.file_exists(texture_path):
		var texture = load(texture_path)
		return texture
	return null

static func get_item_scene_path(item_index: String) -> String:
	var item_name = item_index_to_name(item_index)
	return str("res://src/items/", item_name,"/", item_name, ".tscn")

static func item_index_to_name(item_index: String):
	return item_index.replace(" ", "_").to_lower()

static func convert_crafting_item_type_to_str(type: int) -> String:
	match type:
		0: return "rituals"
		1: return "production"
		2: return "logistic"
		3: return "combat"
		_: return "resource"


static func get_recipes_for_factory(Recipe: Array, factory_name) -> Dictionary:
	for index in Recipe.size():
		if Recipe[index].get("factory") == factory_name:
			return Recipe[index]
	return {}
