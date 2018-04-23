extends Area2D

var Player
var timer = 0
var Ghoul
func _ready():
	Player = get_tree().get_nodes_in_group("Player")[0]
	Ghoul = get_parent()
	pass

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if (body == Player):
			get_tree().change_scene("res://Scenes/GameOver.tscn")
	var areas = get_overlapping_areas()
	for area in areas:
		if (timer <= 1.6):
			timer= timer + delta
			$Sprite.play("Die")
			Ghoul.not_dying = false
		else:
			get_parent().queue_free()
			Player.TRST()
	pass
