extends Area2D

var speed = 100

func _process(delta):
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.get_name() == "Player":
		var player = get_parent().get_node("Player")
		player.hp -= 1
		if player.hp == 0:
			get_parent()._game_over()
