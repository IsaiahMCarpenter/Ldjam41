extends Control

var H = preload("res://Scenes/House.tscn")

func _ready():

	pass



#Starts or quits game
func _on_Start_pressed():
	get_tree().change_scene_to(H)
	pass 


func _on_quit_pressed():
	get_tree().quit()
	pass 
