extends Node2D


var arm = preload("res://sindy.tscn")
var qBank = ["What do a story, a cemetery, and a garden have in common?", "How thoroughly is your food chewed?", "K is for __", "Are you starting a pyramid scheme?", "gobble gooble goodle __", "Because of my reputation i have to be specific so you guys dont think im __", "If it has __, it can't be that bad"]
var aBank = [["Plot", "Your mom", "R"], ["Your mom", "Ofc", "No??"], ["Kapitalism", "Kebab", "Your mom"], ["Join me", "Ofc not", "Your mom"], ["Your mom", "poodle", "moodle"], ["a Furry", "Your mom", "asbdkj"], ["Your mom", "Abs", "Food"]]

func _ready():
	$Quiz.visible = false
	set_process_input(true)
	add_user_signal("next_dia")
	start_dia()

var q = 0

var sDia = [
	["Paul","How concerning! The amount of plastic in the oceans has increased!
	It breaks my heart to see! If only you foolish land animals
	knew how to reduce, reuse, and recycle a little better!"],
	["Batdoon","(While I would argue there are other major contributing factors
	such as agricultural runoff that contribute to water pollution,
	I don’t want to deal with this emotional old man.)"],
	["Sindy","Hum hum… By adding the titrant to this mysterious concoction I
	stole from Robbers, I can unlock even greater powers… mwahahahhahaha"],
	["Batdoon","(Who is this weirdo? What on earth are they mumbling about?
	Also, why are we even in the sea? There was no plot progression
	from the last stage to right now.)"],
	["Sindy","*Hears footsteps* NO! MY TITRATION HAS FAILED!! TIS THE FAULT
	OF YOU OUTSIDERS WHO DARE INTRUDE ON MY LAB!"],
	["Paul","My, oh my. You best be careful out there, young hero. Remember
	to think fast, when Sindy uses her ultimate attack!"],
	["Paul","Sindy is a much more resentful creature than the other two. To
	defeat her you must collect the power of Love itself to
	clear the darkness that clouds her mind."]
	]

var eDia = [
	["Batdoon","And now, it’s time for your baDOOM! *finishing move*"],
	["Sindy","No… NO! My dreams! My aspirations! All washed away by some
	kid who thinks they’re oh so high and mighty because they were never
	subjected to such a fate as mine!"],
	["Sindy","You vile abomination! No one could ever understand what it feels like to be put
	a level below others! To be shamed so much that I feel as if I’ve been cast out to a
	remote land filled with only ice crystals to tear at my sorrow!"],
	["Sindy","Having 2 Ls in my name since birth is a curse! A curse so
	great I must pass it on to others! So they understand the sadness
	that stabs deep into my very existence!"],
	["Sindy","*tears overflow Sindy’s singular eyeball*"],
	["Batdoon","Uhhh..."],
	["Paul","Truly an eloquent choice of words Batdoon! How about looking
	at those special items we picked up earlier? ;)"],
	["Batdoon","You mean those Ls? What help will they offer… Wait, why
	are they glowing???"],
	["Paul","Ok so just rotate both of them just a little and connect the
	short ends… And there you go! A W! >:D"],
	["Batdoon","(So, this is what that old man meant by 2 Ls make a W. It
	sounded like BS earlier, but I guess the world is truly absurd. How I
	wish to return my home, a world of familiarity and comfort!)"],
	["Sindy","W-w-w-what is that? A W from 2 Ls? Preposterous!"],
	["Batdoon","(Geez, this overly dramatic bozo)"],
	["Batoon","So you were talking about how it’s such a “curse” to have Ls.
	Just make a W, not that hard. Here, you can take this W if that idea
	is so hard for you to wrap your head around."],
	["Sindy","*gasp* B-but how?"],
	["Batdoon","??"],
	["Sindy","How could someone be so kind to a lowly being like myself? Such a benevolent
	creature like yourself coming down to the ocean’s depths to cause such
	great changes to my disposition that I feel as if I’ve been reborn?"],
	["Sindy","My heart goes to you, dear Batdoon. Could I, possibly, become
	a person of importance in your life? A friend, perhaps? *extends
	tentacle arm*"],
	["Batdoon","Uhhh, sure."],
	["Batdoon","(Is it really that big of a deal? Although, there’s no harm
	in being friends with a giant squid that dabs though. Sindy can help
	me with my titration lab.)"],
	["Paul","And thus, a beautiful friendship blooms! Batdoon, you’ve grown
	so much over the course of our journey together! As such, I must
	impart my most important lesson to you."],
	["Batdoon","(I almost forgot this weirdo is still here.)"],
	["Paul","After gaining the Love of these 3 mystical creatures, you gained
	something most never get to experience. And that is The Spice of Life."],
	["Paul","Our lives tend to be empty with companionship. But when we add
	it into our lives, all of a sudden, we’re able to find things we
	would have never found otherwise."],
	["Paul","This way, we can grow and become better penguins, or bats in your case."],
	["Paul","So do treasure the friends you’ve made along the way, Batdoon.
	With friends, you’ll always be able to taste The Spice of Life."]
]

func start_dia():
	$Dia.visible = true
	for d in sDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		if "footsteps" in $Dia/Text.text:
			$bgsindy.animation = "mad"
			$bgsindy.play()
		await Signal(self, "next_dia")
	$Dia.visible = false
	phaseOne()


func end_dia():
	$Dia.visible = true
	for d in eDia:
		$Dia/Name.text = d[0]
		$Dia/Text.text = d[1]
		if "heart" in $Dia/Text.text:
			$bgsindy.animation = "happy"
			$bgsindy.play()
		await Signal(self, "next_dia")
	$Dia.visible = false
	_win_game()


func _win_game():
	# idk bro
	get_tree().change_scene_to_file("res://credits.tscn")

func _game_over():
	$RestartText.visible = true
	get_tree().create_timer(2.5).timeout
	get_tree().reload_current_scene()

func _process(delta):
	if Input.is_action_just_pressed("enter") && $Dia.visible == true:
		emit_signal("next_dia")
		
	if $Player.hp <= 0:
		_game_over()
	if $Quiz.qDone == true:
		$Quiz.qDone = false
		if $Player.love < 5:
			randomize()
			q = randi()%2
			if q == 0:
				phaseOne()
			elif q == 1:
				phaseTwo()
		else:
			end_dia()

func quiz():
	$bgsindy.animation = "dab" 
	await get_tree().create_timer(1).timeout
	randomize()
	q = randi()%7
	
	$Quiz/Label.text = qBank[q]
	$Quiz/Button1.text = aBank[q][0]
	$Quiz/Button2.text = aBank[q][1]
	$Quiz/Button3.text = aBank[q][2]
	$Quiz.visible = true
	
	
func phaseTwo():
	await get_tree().create_timer(1).timeout
	lArm(450)
	rArm(450)
	await get_tree().create_timer(3).timeout
	uArm(200)
	rArm(300)
	await get_tree().create_timer(3).timeout
	uArm(600)
	lArm(200)
	await get_tree().create_timer(3).timeout
	lArm(450)
	rArm(450)
	await get_tree().create_timer(1.5).timeout
	lArm(250)
	rArm(250)
	await get_tree().create_timer(3).timeout
	quiz()
	

func phaseOne():
	await get_tree().create_timer(1).timeout
	lArm(450)
	await get_tree().create_timer(3).timeout
	lArm(450)
	rArm(50)
	await get_tree().create_timer(3).timeout
	uArm(1024)
	await get_tree().create_timer(0.5).timeout
	uArm(824)
	await get_tree().create_timer(0.5).timeout
	uArm(624)
	await get_tree().create_timer(0.5).timeout
	uArm(424)
	await get_tree().create_timer(3).timeout
	rArm(450)
	await get_tree().create_timer(0.5).timeout
	rArm(250)
	await get_tree().create_timer(3).timeout
	lArm(450)
	await get_tree().create_timer(0.5).timeout
	lArm(250)
	await get_tree().create_timer(5).timeout
	quiz()


func lArm(trans):
	var armmm = arm.instantiate()
	armmm.position.y = trans
	add_child(armmm)
	
func rArm(trans):
	var armmm = arm.instantiate()
	armmm.opp = true
	armmm.get_node("Sprite").flip_h = true
	armmm.speed = -15
	armmm.position.x = 1524
	armmm.position.y = trans
	add_child(armmm)
	
func uArm(trans):
	var armmm = arm.instantiate()
	armmm.vert = true
	armmm.rotation = 77
	armmm.speed = 12
	armmm.position.y = -450
	armmm.position.x = trans
	add_child(armmm)
	
func dArm(trans):
	var armmm = arm.instantiate()
	armmm.vert = true
	armmm.opp = true
	armmm.rotation = -77
	armmm.speed = -12
	armmm.position.y = 460+600
	armmm.position.x = trans
	add_child(armmm)
