extends Node

var L = true
var check = true
var x = 0
var Player

func _ready():
	Player = get_parent().get_node("Player")
	pass
	
#When mouse is over the button, label appears.
func _on_Button_mouse_entered():
	if (check == true):
		get_node("HaveItem").visible_characters = -1
	else:
		get_node("NothingThere").visible_characters = -1
	pass # replace with function body

#Makes labels disappear
func _on_Button_mouse_exited():
	if (check == true):
		get_node("HaveItem").visible_characters = 0
	else:
		get_node("NothingThere").visible_characters = 0
	pass 

#Player picks up item and deletes the label for item. 
#Stops player from getting infinete keys
func _on_Get_pressed():
	if (x <1):
		if (Player.KEY(L) == true):
			check = false 
			get_node("HaveItem").queue_free()
			x=1
			Player.TURN()
	
	pass 
