extends Node
var Letter
var camera


func _ready():
	camera = get_parent().get_node("Letter/Camera2D")
	pass




func _on_Investigate_pressed():
	camera.make_current()
	pass # replace with function body


func _on_Investigate_mouse_entered():
	get_node("stuff").visible_characters =-1
	pass # replace with function body


func _on_Investigate_mouse_exited():
	get_node("stuff").visible_characters = 0
	pass # replace with function body
