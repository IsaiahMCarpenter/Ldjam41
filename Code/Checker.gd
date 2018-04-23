extends Control



func _on_Nothing_is_here_mouse_entered():
	get_node("Nothin").visible_characters = -1
	pass # replace with function body


func _on_Nothing_is_here_mouse_exited():
	get_node("Nothin").visible_characters = 0
	pass # replace with function body
