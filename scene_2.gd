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
	for d in sDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		await Signal(self, "next_dia")
	$Dia.visible = false
	$Radio.stream = preload("res://res/sound/fight.ogg")
	$Radio.play()
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

func end_dia():
	$Dia.visible = true
	isDia = true
	$Radio.stream = preload("res://res/sound/calm.ogg")
	$Radio.play()
	for d in eDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		if "heart" in $Dia/Text.text:
			$bgsindy.animation = "happy"
			$bgsindy.play()
		await Signal(self, "next_dia")
	$Dia.visible = false
	get_tree().change_scene_to_file("res://stage_3.tscn")

var eDia = [
	["Paul","Aw, look at this little kitty, all wrapped up like a croissant. 🥐
	You could adopt Macbeth if you want to, you know. ;)"],
	["Batdoon","Nahhh, I’m not looking to be killed by my own pet anytime soon."],
	["Paul","GASP! That’s the longest sentence you’ve said to me yet. I’m so touched,
	you’re finally seeing me as a reliable senior. *sniffles*"],
	["Batdoon","(Geez, what a pushover.) *ignores Paul*"],
	["Batdoon","Oh look, another L."],
	["Paul","Fantastic! Now I shall teach you the power of the Ls 😌"],
	["Paul","Back in my day, the Ls would join hands to become a W. Do you know the
	saying, young child?"],
	["Paul","“Two Ls make a W.” *old, wizened expression*"],
	["Batdoon","??? So what?"],
	["Batdoon","(Actually, I’ve heard my grandmother mention this to me. But I thought
	she was being silly, like most old people)"],
	["Paul","It’s something of a mystery, but a W can grant great power to those in need.
	Hold onto it, for now, young traveller."]
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
		choco.position = Vector2(randf_range(220, 770), randf_range(70, 490))


func _on_restart_timer_2_timeout():
	get_tree().reload_current_scene()
	
func _win_game():
	$chocobarTimer.stop()
	$MacebethBounce/AnimatedSprite2D.play("sleep")
	$MacebethBounce.set_velocity(Vector2(0, 0))
	end_dia()


func _game_over():
	$RestartText.visible = true
	$RestartTimer.start()

func _on_restart_timer_timeout():
	$RestartText.visible = true
	get_tree().reload_current_scene()
