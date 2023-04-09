extends Area2D

func _ready():
	$AnimatedSprite2D.play("default")

func _on_disappear_timer_timeout():
	print("bling gone")
	queue_free()


func _on_body_entered(body):
	if body.get_name() == "Player":
		get_parent().get_node("Player").love += 1
		if get_parent().get_node("Player").love == 5:
			get_parent()._win_game()
		queue_free()
		
