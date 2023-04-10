extends Node

var sDia = [["Batdoon", "*wanders into Youmax’s cave* Ohohoho, so many shiny jewels. \n Perfect for my bat-gauntlet!"], 
["Youmax", "Unbelievable! An intruder in MY cave??? I cannot allow this to happen! >:("],
["Youmax", "Oh but this intruder carries an object of great lustre in her arms? \n I shall take what is rightfully mine! >:D *swipes gauntlets*"],
["Batdoon", "Huh?? What was that? OH NO, MY PRECIOUS GAUNTLETS D:< *sobs violently*"],
["Batdoon", "(What will I do? My family, my ANCESTORS, will be so disappointed in me! \n I feel lost all of a sudden, like a frail autumn leaf descending from the tree \n branch that once held onto me so tightly.)"],
["Batdoon", "(My family heirloom which was once so precious to me, to think it could’ve \n been so easily taken from my grasp!)"],
["Paul", "There, there, young child. ‘Tis only the fault of the L curse that Youmax has \n been overcome with such AVARICE. 😔 Take my flipper, young child. And I shall \n teach you the ways of taking the L."],
["Batdoon", "What are you on, I’m no L-taker. >:O"],
["Batdoon", "(Whomst is this strange old man? What could they possibly want from me?)"],
["Batdoon", "(Perhaps they took my precious family heirloom? If so, they are truly an insolent \n person! Wait, are those my bat-gauntlets in that pink dragon’s possession?)"],
["Batdoon", "(I- How could one do such a thing!)"],
["Paul", "Alas, poor child… Never mind that, simply follow my lead then. *sniffles*"],
["Paul", "Youmax is attacking you right now, so use the arrow keys to dodge the attacks. \n Remember to jump! :D"],
["Paul", "And while you’re at it, grab the bling💎 around you to fill the Love meter! \n Once, the Love meter is full, Youmax will be pacified."]
]

var eDia = [["Youmax", "Zzzz…"],
["Paul", "My, my! Well done, young hero! 😌 Youmax can be quite feisty with other beings, but after giving her enough bling she’s just a drowsy desirous dragon. See, she’s even asleep, a great show of friendship to you!"],
["Paul", "Very commendable performance dodging those nail polish-covered teeth. 😌"],
["Paul", "Why nail polish-covered teeth, you ask?"],
["Batdoon", "No one asked."],
["Paul", "Because this tiny little dragon loves to add a little glam into her life and teeth are simply the best place for that. :)"],
["Batdoon", "BTW, what is this L that Youmax left behind?"],
["Paul", "Ah! This is what I meant by “taking the L.” It may seem useless now, but no worries my budding fellow, it’ll aid you when you need it most."],
["Batdoon", "(Goodness gracious, being with this old-timer is truly a painful experience. It feels as though my ears are chipping away the more I hear them talk. Do they really need to say the first thing that comes to mind?)"],
["Batdoon", "Ew, you’re so weird."],
["Paul", "GASP! My feelings!!"]
]

var start = false

func _ready():
	$Dia.visible = false
	set_process_input(true)
	add_user_signal("next_dia")
	start_dia()

func start_dia():
	$Dia.visible = true
	$youmax/AnimatedSprite2D.play("enraged")
	for d in sDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		await Signal(self, "next_dia")
	$Dia.visible = false
	$youmax/AnimatedSprite2D.play("attack")
	$TeethTimer.start()
	$BlingTimer.start()
	$FireballTimer.start()

func end_dia():
	$Dia.visible = true
	$youmax/AnimatedSprite2D.play("sleepy")
	for d in eDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		await Signal(self, "next_dia")
	$Dia.visible = false
	queue_free()

func _process(delta):
	if Input.is_action_just_pressed("enter") && $Dia.visible == true:
		emit_signal("next_dia")

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
	$TeethTimer.stop()
	$BlingTimer.stop()
	$FireballTimer.stop()
	end_dia()

func _game_over():
	$RestartText.visible = true
	$RestartTimer.start()

func _on_fireball_timer_timeout():
	var nodes = get_tree().get_nodes_in_group("fireball")
	var node = nodes[randi() % nodes.size()]
	var fireball = preload("res://fireball.tscn").instantiate()
	add_child(fireball)
	fireball.position = node.position
	fireball.ogY = node.global_position.y

func _on_restart_timer_timeout():
	$RestartText.visible = false
	get_tree().reload_current_scene()
