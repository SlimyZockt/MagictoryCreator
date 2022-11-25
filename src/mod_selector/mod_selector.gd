extends Control
class_name ModSelector

@export
var loading_type: int = 0

@onready
var vBoxContainer: VBoxContainer = get_node("%ModList")


func _ready() -> void:
	var mods = find_mods()
	for mod in mods:
		add_mod_item(mod)

func find_mods() -> Array:
	var mods: Array[Mod]
	if FileAccess.file_exists("res://data/mods/base.tres"):
		var mod = ResourceLoader.load("res://data/mods/base.tres")
		mods.append(mod)
	return mods

func add_mod_item(mod: Mod):
	var mod_item := CheckBox.new() if loading_type == 1 else Button.new()
	var _err = mod_item.pressed.connect(on_mod_item_pressed.bind(mod, mod_item))
	mod_item.text = mod.name
	if mod.name == "BaseMad":
		if mod_item is CheckBox:
			mod_item.button_pressed = true
			mod_item.disabled = true
			Global.current_mods.append(mod)
	mod_item.alignment = HORIZONTAL_ALIGNMENT_RIGHT
	vBoxContainer.add_child(mod_item)

func on_mod_item_pressed(mod: Mod, mod_item: Button):
	if loading_type == 1:
		if mod_item.pressed:
			Global.current_mods.append(mod)
			return
		Global.current_mods.erase(mod)
		return
	var inst = Global.switch_scene(load("res://src/mod_editor/mod_editor.tscn"))


func _on_button_pressed():
	var _inst = Global.switch_scene(load("res://src/mod_creator/mod_creator.tscn"))
