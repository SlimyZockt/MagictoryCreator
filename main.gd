extends Node

@onready
var title_screen: PackedScene = load("res://src/mod_selector/mod_selector.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.switch_scene(title_screen)
