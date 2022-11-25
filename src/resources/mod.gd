extends Resource
class_name Mod

@export var name = ""
@export var version = "0.0.0"
@export var author = "SlimyZockt"
@export var discription = "-"

@export var itemDB := {}
@export var enemyDB := {}
@export var map := []


static func setup(new_name: String, new_version: String, new_author: String, new_discription: String) -> Mod:
	var mod = Mod.new()
	
	mod.name = new_name
	mod.version = new_version
	mod.author = new_author 
	mod.discription = new_discription
	
	return mod

