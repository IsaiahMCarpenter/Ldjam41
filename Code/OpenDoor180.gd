extends Control
var Tile
var Player
func _ready():
	Tile = get_parent().get_parent().get_node("Boundry/180Door")
	Player = get_parent().get_node("Player")
	pass



func _on_Toggle_pressed():
	Tile.queue_free()
	get_node("Toggle").queue_free()
	Player.TURN()
	pass # replace with function body
