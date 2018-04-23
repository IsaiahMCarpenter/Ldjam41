extends Node

var Door
var Player
func _ready():
	Player = get_node("Player")
	Player.CRRT(2)
	Door = get_node("Door")
	Door.count = 2
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
