extends HBoxContainer


func _ready() -> void:
	pass


func _on_del_button_pressed():
	queue_free()
