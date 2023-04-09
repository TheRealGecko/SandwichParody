extends RigidBody2D

func _ready():
	$AnimatedSprite2D.play("default")

func _on_disappear_timer_timeout():
	print("bling gone")
	queue_free()
