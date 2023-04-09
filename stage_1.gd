extends Node

@onready var player = $Player

func _ready():
	pass

func _on_teeth_timer_timeout():
	var nodes = get_tree().get_nodes_in_group("teeth")
	var node = nodes[randi() % nodes.size()]
	var pos = node.position
	var teeth = preload("res://nail_polish_teeth.tscn").instantiate()
	add_child(teeth)
	teeth.position = pos


func _on_bling_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomX = rng.randi_range(180, 770)
	var randomY = rng.randi_range(70, 490)
	var bling = preload("res://bling.tscn").instantiate()
	add_child(bling)
	bling.position = Vector2(randomX, randomY)


func _win_game():
	# idk bro
	queue_free()

func _game_over():
	# mb add a u died screen here
	get_tree().reload_current_scene()


func _on_fireball_timer_timeout():
	var nodes = get_tree().get_nodes_in_group("fireball")
	var node = nodes[randi() % nodes.size()]
	var fireball = preload("res://fireball.tscn").instantiate()
	add_child(fireball)
	fireball.position = node.position
	fireball.ogY = node.global_position.y
