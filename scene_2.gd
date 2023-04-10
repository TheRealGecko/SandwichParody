extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var Player = preload("res://player.tscn").instantiate()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_chocobar_timer_timeout():
	randomize()
	var choco = preload("res://chocobar.tscn").instantiate()
	add_child(choco)
	choco.position = Vector2(randf_range(180, 770), randf_range(70, 490))


func _on_restart_timer_2_timeout():
	get_tree().reload_current_scene()
	
func _win_game():
	$chocobarTimer.stop()
	$happydance.play("run")


	

func _game_over():
	$RestartText.visible = true
	$RestartTimer.start()

