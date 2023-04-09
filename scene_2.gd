extends Node2D
var chocobar = preload("res://chocobar.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_chocobar_timer_timeout():
	randomize()
	var choco = chocobar.instance()
	choco.position = Vector2(randf_range(180, 770), randf_range(70, 530))
	choco.connect("hit", self, "_oh_hit_choco")
	add_child(choco)

func _on_hit_choco():
		print("hello")
