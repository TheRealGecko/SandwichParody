extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_chocobar_timer_timeout():
	randomize()
	var choco = preload("res://chocobar.tscn").instantiate()
	add_child(choco)
	choco.position = Vector2(randf_range(180, 770), randf_range(70, 490))

func _on_hit_choco():
		print("hello")
