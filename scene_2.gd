extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	add_user_signal("next_dia")
	$Radio.stream = preload("res://res/sound/calm.ogg")
	$Radio.play()
	start_dia()

var isDia = true

func start_dia():
	$Dia.visible = true
	$chocobar.visible = false
	for d in sDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		await Signal(self, "next_dia")
	$Dia.visible = false
	$Radio.stream = preload("res://res/sound/fight.ogg")
	$Radio.play()
	$chocobar.visible = true
	true
	isDia = false

var sDia = [
	["Paul","Here, the great Macbeth resides. Don’t worry though, she’s not as monstrous
	as that Macbeth you read about in Grade 11 English."],
	["Paul","She’s just a tiny lil cat that loves snacking on all kinds of delicacies. :D"],
	["Paul","By the way, she’s actually a long-lived vampire originating from the 1600s,
	a rare being indeed!"],
	["Macbeth","Meowf"],
	["Batdoon","Awwwww, what a cute cat!"],
	["Batdoon","(She reminds me of my own lovely cattos at home. Oh! How I miss them so!
	How could I let myself get led on by some strange old man? I would do anything to
	just go back home and cuddle with my adorable fluff balls!)"],
	["Macbeth","*tail slap*"],
	["Batdoon","!?!?"],
	["Paul","Oh I forgot to mention but, Macbeth has no arms or legs, just one tadpole tail. :>"],
	["Batdoon","..."],
	["Paul","Keep in mind to collect chocolate🍫 to pacify Macbeth!"],
	["Batdoon","So just like Youmax? Why are these creatures so simple-minded? 😔"]
]

var Player = preload("res://player.tscn").instantiate()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter") && $Dia.visible == true:
		emit_signal("next_dia")

func _on_chocobar_timer_timeout():
	if isDia == false:
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

