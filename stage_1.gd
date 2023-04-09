extends Node

@onready var ui = $ui

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
	var randomY = rng.randi_range(70, 530)
	var bling = preload("res://bling.tscn").instantiate()
	add_child(bling)
	bling.position = Vector2(randomX, randomY)

func _on_player_body_entered(body):
	print("hehe")
	if body.get_name() == "bling":
		print("bling bling")
		ui.loveCnt += 1
		if ui.loveCnt == 5:
			_win_game()
	elif body.get_name() == "nail_polish_teeth":
		ui.hpCnt -= 1
		if ui.hpCnt == 0:
			_game_over()

func _win_game():
	# idk bro
	queue_free()

func _game_over():
	# mb add a u died screen here
	get_tree().reload_current_scene()
