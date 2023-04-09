extends Area2D

func _ready():
	$AnimatedSprite.play("default")
	
func _on_body_entered(body):
	print(body.get_name())
	queue_free() 


func _on_disappear_timer_timeout():
	queue_free()
