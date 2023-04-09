extends Area2D

var speed = 100

func _process(delta):
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
