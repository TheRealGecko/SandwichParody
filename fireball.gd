extends Area2D

var speed = 150
var ogY
var goDown = true

func _ready():
	pass

func _process(delta):
	global_position.x -= speed * delta
	if global_position.y >= ogY + 100:
		goDown = false
	elif global_position.y <= ogY:
		goDown = true
	
	if goDown == true:
		global_position.y += speed * delta
	else:
		global_position.y -= speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.get_name() == "Player":
		var player = get_parent().get_node("Player")
		player.hp -= 1
		if player.hp == 0:
			get_parent()._game_over()
