@tool
extends Control

enum DataTypes {INT, FLOAT, STRING, BOOL}

@export var categorys: Array[String]: set = set_categorys # (Array, String)
@export var categorys_types: Array[String]: set = set_categorys_types # (Array, DataTypes)

func set_categorys(new_val) -> void:
	categorys = new_val
	categorys_types.resize(categorys.size())

func set_categorys_types(new_val) -> void:
	categorys_types = new_val
	categorys.resize(categorys_types.size())


func _on_new_item_button_pressed():
	var item_row_pck: PackedScene = load("res://src/mod_editor/item_row.tscn")
	var item_row = item_row_pck.instantiate()
	$PanelContainer/TabContainer/ItemDB/VBoxContainer/ScrollContainer.add_child(item_row)
