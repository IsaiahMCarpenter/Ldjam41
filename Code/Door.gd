extends Node

var y = false
var Player
var count = 0


func _ready():
	Player = get_parent().get_node("Player")
	pass

#If door is locked, checks to see if player has key.
#If player has key unlocks door and deletes the Unlock button.
func _on_Unlock_pressed():
	if (Player.INV(y) == true):
		get_node("Open").set_disabled(false)
		get_node("Unlock").queue_free()
		#Takes player Key away then lets ghoul have its turn
		Player.RST(y)
		Player.TURN()
	else:
		print("Also Works")
	pass


func _on_Open_pressed():
	if (count == 0):
		get_tree().change_scene("res://Scenes/Hallway.tscn")
	if (count == 1):
		get_tree().change_scene("res://Scenes/Foyer.tscn")
	if (count == 2):
		get_tree().change_scene("res://Scenes/Winner.tscn")
	pass 
