extends Node

var choice


func _ready():
	randomize()
	choice = randi() % 3
	if (choice == 0):
		$Audio1._set_playing(true)
	if (choice == 1):
		$Audio2._set_playing(true)
	if (choice == 2):
		$Audio3._set_playing(true)


func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
	pass # replace with function body


func _on_Quit_pressed():
	get_tree().quit()
	pass # replace with function body
