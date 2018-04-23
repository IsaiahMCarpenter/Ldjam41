extends KinematicBody2D

var N_Speed = 200
var S_Speed = 300
var Max_Speed = 375
var movement = Vector2()
var Floor_Normal = Vector2(0,-1)
var player_turn = true
var x = false
var Turn_Count = 4
var Count_Down = false
var timer = 0
var SP = 0
var AudioTimer = 0
	
#Gives player a key
func KEY(L):
	x = L
	return x
	
#gets rid of key
func RST(y):
	x = y
	
#Takes Key from inventory to unlock door
func INV(y):
	if (x == true):
		y = true
	else:
		y = false
	return y
	
#Takes a turn every click on object and at 0 starts countdown
func TURN():
	Turn_Count = Turn_Count -1
	print(Turn_Count)
	
	if (Turn_Count == 0):
		Count_Down = true

#Gives player correct amount of actions. Used in door
func CRRT(C):
	Turn_Count = C
	return C
#Once ghost is gone gives player 5 more turns/actions.
func TRST():
	Turn_Count = 5
	player_turn = true
	return Turn_Count
	
#Ghoul checks to see if it is his turn
func CHECK():
	return player_turn
	
func _physics_process(delta):
	#Moves camera back to player
	if Input.is_action_pressed("ui_cancel"):
		$Camera.make_current()
	#Checks to make sure it is players turn
	if (player_turn == true):
		#movement
		if (Count_Down == true):
			$Audio3.play()
			if (AudioTimer < 1):
				AudioTimer = AudioTimer + delta
			if (AudioTimer >=1 ):
				$Audio2.play()
				AudioTimer = 0
			if Input.is_action_pressed("ui_right"):
				movement.y = 0
				movement.x = min(movement.x + S_Speed, Max_Speed*2)
				$Sprite.flip_h = false
				$Sprite.play("Run")
				SP = 0
				
			elif Input.is_action_pressed("ui_left"):
				movement.y = 0
				movement.x = max(movement.x - S_Speed, -Max_Speed*2)
				$Sprite.flip_h = true
				$Sprite.play("Run")
				SP = 0
				
			elif Input.is_action_pressed("ui_up"):
				movement.x = 0
				movement.y = max(movement.y - S_Speed, -Max_Speed*2)
				$Sprite.play("Foward")
				SP = 1
				
			elif Input.is_action_pressed("ui_down"):
				movement.x = 0
				movement.y = min(movement.y + S_Speed, Max_Speed*2)
				$Sprite.play("Back")
				SP = 2
				
			else:
				movement.x = 0
				movement.y= 0
				if(SP == 0):
					$Sprite.play("Idle")
				if(SP == 1):
					$Sprite.play("FowardIdle")
				if(SP == 2):
					$Sprite.play("BackIdle")
				
		else:
			if (AudioTimer < 1.5):
				AudioTimer = AudioTimer + delta
			if (AudioTimer >=1.5 ):
				$Audio.play()
				AudioTimer = 0
			if Input.is_action_pressed("ui_right"):
				movement.y = 0
				movement.x = min(movement.x + N_Speed, Max_Speed)
				$Sprite.flip_h = false
				$Sprite.play("Run")
				SP = 0
			elif Input.is_action_pressed("ui_left"):
				movement.y = 0
				movement.x = max(movement.x - N_Speed, -Max_Speed)
				$Sprite.flip_h = true
				$Sprite.play("Run")
				SP = 0
			elif Input.is_action_pressed("ui_up"):
				movement.x = 0
				movement.y = max(movement.y - N_Speed, -Max_Speed)
				$Sprite.play("Foward")
				SP = 1
			elif Input.is_action_pressed("ui_down"):
				movement.x = 0
				movement.y = min(movement.y + N_Speed, Max_Speed)
				$Sprite.play("Back")
				SP = 2
			else:
				movement.x = 0
				movement.y= 0
				if(SP == 0):
					$Sprite.play("Idle")
				if(SP == 1):
					$Sprite.play("FowardIdle")
				if(SP == 2):
					$Sprite.play("BackIdle")
			
			#gives player 5 seconds to get to safety
		if (Count_Down == true):
			timer = timer+delta
			if (timer >= 5):
				player_turn = false
				Count_Down = false
				timer = 0
			
	else:
		movement.x = 0
		movement.y=0
		
	
	movement = move_and_slide(movement, Floor_Normal)
	pass


