extends KinematicBody2D
var movement = Vector2()
var Floor_Normal = Vector2(0,-1)
var Player
var speed = 200
var yspeed = 200
var not_dying = true
#gets the Player node

func _ready():
	Player = get_tree().get_nodes_in_group("Player")[0]
	pass
	
func _physics_process(delta):
	#Checks to see whos turn
	if (Player.CHECK() == false):
		#Moves toward the player
		if (not_dying == true):
			if (Player.position.x < position.x):
				movement.x = speed * -1
				get_node("Kill/Sprite").flip_h = false
				get_node("Kill/Sprite").play("Right")
				
			else:
				movement.x = speed 
				get_node("Kill/Sprite").flip_h = true
				get_node("Kill/Sprite").play("Right")
				
			if (Player.position.y < position.y):
				movement.y = yspeed*-1
				
			else:
				movement.y = yspeed
		else: 
			movement.x = 0
			movement.y = 0
	else:
		get_node("Kill/Sprite").play("Idle")
	
	
	movement = move_and_slide(movement, Floor_Normal)