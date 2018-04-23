extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Player
var Door
func _ready():
	Player = get_node("Player")
	Player.CRRT(2)
	Door = get_node("Door")
	Door.count = 1
	pass


